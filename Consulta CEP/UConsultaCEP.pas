unit UConsultaCEP;

interface

uses
  System.SysUtils, System.Classes, System.Net.HttpClient, System.JSON;

type
  // Classe que armazenará o resultado da consulta de CEP
  TEndereco = class
  private
    FCEP: string;
    FLogradouro: string;
    FBairro: string;
    FLocalidade: string;
    FUF: string;
    FIBGE: string;
    FLatitude: string;
    FLongitude: string;
  public
    property CEP: string read FCEP write FCEP;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Bairro: string read FBairro write FBairro;
    property Localidade: string read FLocalidade write FLocalidade;
    property UF: string read FUF write FUF;
    property IBGE: string read FIBGE write FIBGE;
    property Latitude: string read FLatitude write FLatitude;
    property Longitude: string read FLongitude write FLongitude;

    procedure CarregarDeJSON(const AJSON: string);
  end;

  // Classe principal para buscar o CEP em várias APIs
  TConsultaCEP = class
  private
    HttpClient: THttpClient;
    function ConsultarViaCep(const CEP: string): TEndereco;
    function ConsultarApiCep(const CEP: string): TEndereco;
    function ConsultarAwesomeApi(const CEP: string): TEndereco;
  public
    function BuscarCep(const CEP: string): TEndereco;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEndereco }

procedure TEndereco.CarregarDeJSON(const AJSON: string);
var
  JSONObj: TJSONObject;
begin
  JSONObj := TJSONObject.ParseJSONValue(AJSON) as TJSONObject;
  try
    if Assigned(JSONObj) then
    begin
      // Carrega os valores que estão presentes no JSON
      FCEP := JSONObj.GetValue<string>('cep', '');
      FLogradouro := JSONObj.GetValue<string>('logradouro', '');
      FBairro := JSONObj.GetValue<string>('bairro', '');
      FLocalidade := JSONObj.GetValue<string>('localidade', JSONObj.GetValue<string>('cidade', ''));
      FUF := JSONObj.GetValue<string>('uf', '');
      FIBGE := JSONObj.GetValue<string>('ibge', '');
      FLatitude := JSONObj.GetValue<string>('latitude', '');
      FLongitude := JSONObj.GetValue<string>('longitude', '');
    end;
  finally
    JSONObj.Free;
  end;
end;

{ TConsultaCEP }

constructor TConsultaCEP.Create;
begin
  HttpClient := THttpClient.Create;
end;

destructor TConsultaCEP.Destroy;
begin
  HttpClient.Free;
  inherited;
end;

function TConsultaCEP.ConsultarViaCep(const CEP: string): TEndereco;
var
  Response: IHTTPResponse;
  Endereco: TEndereco;
begin
  Endereco := TEndereco.Create;
  try
    Response := HttpClient.Get('https://viacep.com.br/ws/' + CEP + '/json/');
    if Response.StatusCode = 200 then
    begin
      Endereco.CarregarDeJSON(Response.ContentAsString);
      Result := Endereco;
    end
    else
      raise Exception.Create('Erro na consulta ViaCEP');
  except
    Endereco.Free;
    raise;
  end;
end;

function TConsultaCEP.ConsultarApiCep(const CEP: string): TEndereco;
var
  Response: IHTTPResponse;
  Endereco: TEndereco;
begin
  Endereco := TEndereco.Create;
  try
    Response := HttpClient.Get('https://ws.apicep.com/cep/' + CEP + '.json');
    if Response.StatusCode = 200 then
    begin
      Endereco.CarregarDeJSON(Response.ContentAsString);
      Result := Endereco;
    end
    else
      raise Exception.Create('Erro na consulta APICEP');
  except
    Endereco.Free;
    raise;
  end;
end;

function TConsultaCEP.ConsultarAwesomeApi(const CEP: string): TEndereco;
var
  Response: IHTTPResponse;
  Endereco: TEndereco;
begin
  Endereco := TEndereco.Create;
  try
    Response := HttpClient.Get('https://cep.awesomeapi.com.br/json/' + CEP);
    if Response.StatusCode = 200 then
    begin
      Endereco.CarregarDeJSON(Response.ContentAsString);
      Result := Endereco;
    end
    else
      raise Exception.Create('Erro na consulta AwesomeAPI');
  except
    Endereco.Free;
    raise;
  end;
end;

function TConsultaCEP.BuscarCep(const CEP: string): TEndereco;
begin
  try
    // Primeiro tenta ViaCEP
    Result := ConsultarViaCep(CEP);
  except
    on E: Exception do
    begin
      try
        // Se falhar, tenta APICEP
        Result := ConsultarApiCep(CEP);
      except
        on E: Exception do
        begin
          try
            // Se falhar, tenta AwesomeAPI
            Result := ConsultarAwesomeApi(CEP);
          except
            on E: Exception do
              raise Exception.Create('Não foi possível consultar o CEP em nenhuma das APIs');
          end;
        end;
      end;
    end;
  end;
end;

end.

