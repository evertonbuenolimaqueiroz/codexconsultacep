unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    con: TFDConnection;
    qycep: TFDQuery;
    qycepcodigo: TFDAutoIncField;
    qycepcep: TStringField;
    qyceplogradouro: TStringField;
    qycepbairro: TStringField;
    qycepcidade: TStringField;
    qycepibge: TStringField;
    qycepestado: TStringField;
    qycepnumero: TStringField;
    qycepcomplemento: TStringField;
    qyceplatitude: TStringField;
    qyceplongitude: TStringField;
    qysql: TFDQuery;
    procedure qycepBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MsgBox;

{$R *.dfm}

procedure TDM.qycepBeforePost(DataSet: TDataSet);
begin
  if qycepcep.IsNull then
  begin
    MsgBoxSimples('CEP n�o informado', tmbAdvertencia);
    Abort;
  end;

  qysql.Close;
  qysql.SQL.Text := 'SELECT 1 FROM cep WHERE cep = :cep';
  qysql.ParamByName('cep').AsString := qycepcep.AsString;
  qysql.Open();

  if not qysql.IsEmpty then
  begin
    MsgBoxSimples('CEP j� cadastrado', tmbAdvertencia);
    Abort;
  end;

end;

end.
