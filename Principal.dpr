program Principal;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uConsultaCPF in 'uConsultaCPF.pas' {frmConsultaCPF},
  uEmail in 'uEmail.pas' {frmConfigEmail},
  uConfigEmail in 'uConfigEmail.pas',
  uPesquisar in 'uPesquisar.pas' {frmPesquisar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmConsultaCPF, frmConsultaCPF);
  Application.CreateForm(TfrmConfigEmail, frmConfigEmail);
  Application.CreateForm(TfrmPesquisar, frmPesquisar);
  Application.Run;
end.
