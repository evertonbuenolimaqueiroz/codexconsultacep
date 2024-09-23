program ConsoleServer;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.CORS,
  System.SysUtils,
  UConsultaCEP;

procedure ValidarCEPHandler(Req: THorseRequest; Res: THorseResponse);
var
  CEP: string;
  Endereco: TEndereco;
  ConsultaCEP: TConsultaCEP;
begin
  CEP := Req.Params['cep'];

  ConsultaCEP := TConsultaCEP.Create;
  try
    try
      Endereco := ConsultaCEP.BuscarCep(CEP);
      try
        Res.Send(Format
          ('{"cep": "%s", "logradouro": "%s", "bairro": "%s", "localidade": "%s", "uf": "%s", "ibge": "%s", "latitude": "%s", "longitude": "%s"}',
          [Endereco.CEP, Endereco.Logradouro, Endereco.Bairro,
          Endereco.Localidade, Endereco.UF, Endereco.IBGE, Endereco.Latitude,
          Endereco.Longitude]));
      finally
        Endereco.Free;
      end;
    except
      on E: Exception do
        Res.Status(500).Send('Erro ao consultar o CEP: ' + E.Message);
    end;
  finally
    ConsultaCEP.Free;
  end;
end;

begin
  THorse.Use(CORS);

  THorse.Get('/cep/:cep', ValidarCEPHandler);

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9000);
end.
