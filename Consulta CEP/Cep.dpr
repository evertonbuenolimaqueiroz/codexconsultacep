program Cep;

uses
  Vcl.Forms,
  uCep in 'uCep.pas' {Fcep},
  UConsultaCEP in 'UConsultaCEP.pas',
  MsgBox in 'MsgBox.pas',
  UConsultaCepAPI in 'UConsultaCepAPI.pas',
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFcep, Fcep);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
