unit uCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TFcep = class(TForm)
    pgprincipal: TPageControl;
    tsconsulta: TTabSheet;
    tsdados: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btncep: TSpeedButton;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    dsconsultadados: TDataSource;
    ncep: TDBNavigator;
    edtcep: TDBEdit;
    edtlogradouro: TDBEdit;
    edtbairro: TDBEdit;
    edtcidade: TDBEdit;
    edtibge: TDBEdit;
    edtestado: TDBEdit;
    edtnumero: TDBEdit;
    edtcomplemento: TDBEdit;
    edtlongitude: TDBEdit;
    edtlatitude: TDBEdit;
    procedure btncepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsconsultadadosStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidarCEP(const CEP: string): Boolean;
    procedure ConsultarCEP(psCEP: String);
  end;

var
  Fcep: TFcep;

implementation

{$R *.dfm}

uses UConsultaCEP, MsgBox, UConsultaCepAPI, uDM;

procedure TFcep.btncepClick(Sender: TObject);
var
  ConsultaCEPHorse: TConsultaCepAPI;
begin
  if not ValidarCEP(edtcep.Text) then
  begin
    MsgBoxSimples('CEP inv�lido.', tmbAdvertencia);
    edtcep.SetFocus;
    Exit;
  end;

  if RadioGroup1.ItemIndex = 0 then
    ConsultarCEP(edtcep.Text)
  else
  begin
    ConsultaCEPHorse := TConsultaCepAPI.Create;
    try
      try
        if ConsultaCEPHorse.ConsultarCEPHorse(edtcep.Text) then
        begin
          edtlogradouro.Text := ConsultaCEPHorse.Logradouro;
          edtbairro.Text := ConsultaCEPHorse.Bairro;
          edtcidade.Text := ConsultaCEPHorse.Localidade;
          edtestado.Text := ConsultaCEPHorse.UF;
          edtibge.Text := ConsultaCEPHorse.IBGE;
          edtlatitude.Text := ConsultaCEPHorse.Latitude;
          edtlongitude.Text := ConsultaCEPHorse.Longitude;
        end;

        if not(ConsultaCEPHorse.Erro = EmptyStr) then
          MsgBoxSimples('Erro: ' + ConsultaCEPHorse.Erro, tmbAdvertencia);
      finally
        ConsultaCEPHorse.Free;
      end;
    except
      on E: Exception do
        MsgBoxSimples('Erro fatal: ' + E.Message, tmbErro);
    end;
  end;
end;

procedure TFcep.ConsultarCEP(psCEP: String);
var
  ConsultaCEP: TConsultaCEP;
  Endereco: TEndereco;
begin
  ConsultaCEP := TConsultaCEP.Create;
  try
    // Faz a consulta do CEP
    Endereco := ConsultaCEP.BuscarCep(psCEP);
    try
      // Exibe os dados do endere�o
      edtlogradouro.Text := Endereco.Logradouro;
      edtbairro.Text := Endereco.Bairro;
      edtcidade.Text := Endereco.Localidade;
      edtestado.Text := Endereco.UF;
      edtibge.Text := Endereco.IBGE;
      edtlatitude.Text := Endereco.Latitude;
      edtlongitude.Text := Endereco.Longitude;
    finally
      Endereco.Free;
    end;
  except
    on E: Exception do
      MsgBoxSimples('Erro: ' + E.Message, tmbErro);
  end;
  ConsultaCEP.Free;
end;

procedure TFcep.dsconsultadadosStateChange(Sender: TObject);
begin
  if dsconsultadados.State = dsInsert then
    pgprincipal.ActivePage := tsdados;

  if dsconsultadados.State = dsEdit then
    pgprincipal.ActivePage := tsdados;

  if dsconsultadados.State = dsBrowse then
    pgprincipal.ActivePage := tsconsulta;
end;

procedure TFcep.FormShow(Sender: TObject);
begin
  dm.qycep.Close;
  dm.qycep.Open();
end;

function TFcep.ValidarCEP(const CEP: string): Boolean;
var
  Limpo: string;
  Numero: Integer;
begin
  // Remove qualquer caractere que n�o seja n�mero (ex.: h�fen)
  Limpo := StringReplace(CEP, '-', '', [rfReplaceAll]);

  // Verifica se o comprimento da string � exatamente 8 e se � um n�mero
  Result := (Length(Limpo) = 8) and TryStrToInt(Limpo, Numero);
end;

end.
