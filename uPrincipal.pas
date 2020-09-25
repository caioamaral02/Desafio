unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrSocket, ACBrConsultaCPF,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls, ACBrMail,
  Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    ACBrConsultaCPF1: TACBrConsultaCPF;
    edtID: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCPF: TMaskEdit;
    Label1: TLabel;
    edtEmail: TLabeledEdit;
    Label2: TLabel;
    btnConsultaCPF: TBitBtn;
    edtDataConsulta: TMaskEdit;
    Label3: TLabel;
    btnCadastrar: TButton;
    edtDataNascimento: TDateTimePicker;
    btnAlterar: TButton;
    Label4: TLabel;
    edtSituacaoCadastral: TEdit;
    btnCancelar: TButton;
    btnExcluir: TButton;
    btnEnviarEmail: TButton;
    ACBrMail1: TACBrMail;
    btnPesquisar: TButton;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Email1: TMenuItem;
    mmAssunto: TMemo;
    procedure FormShow(Sender: TObject);
    procedure btnConsultaCPFClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure edtIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure Email1Click(Sender: TObject);
  private
    { Private declarations }
    function Cadastrar: Boolean;
    procedure Alterar;
    procedure Carregar;
    procedure LimparCampos;
    procedure CarregarCodigo;
    procedure Excluir;
    function ValidarCPF(CPF: String): Boolean;
    procedure AjustaParametrosDeEnvio;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uConsultaCPF, uEmail, uDM, uPesquisar, uConfigEmail;

procedure TfrmPrincipal.ACBrMail1MailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin
  case aStatus of
    pmsDone:
      ShowMessage('E-mail Enviado com sucesso!');
  end;
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.AjustaParametrosDeEnvio;
begin
  mmAssunto.Clear;
  mmAssunto.Lines.Add('Parabéns Sr(a). ' + edtNome.Text +
    ' seu cadastro foi efetuado com sucesso! ');

  ACBrMail1.From := frmConfigEmail.edtUsuarioSMTP.Text;
  ACBrMail1.FromName := 'Caio';
  ACBrMail1.Host := frmConfigEmail.edtHostSMTP.Text;
  ACBrMail1.Username := frmConfigEmail.edtUsuarioSMTP.Text;
  ACBrMail1.Password := frmConfigEmail.edtSenha.Text;
  ACBrMail1.Port := frmConfigEmail.edtPorta.Text;
  ACBrMail1.SetTLS := frmConfigEmail.rbTLS.Checked;
  ACBrMail1.SetSSL := frmConfigEmail.rbSSL.Checked;
  ACBrMail1.Subject := 'Cadastro Efetuado com Sucesso!';
  ACBrMail1.AddAddress(edtEmail.Text, edtNome.Text);
  ACBrMail1.AltBody.Assign(mmAssunto.Lines);
end;

procedure TfrmPrincipal.Alterar;
begin
  with DM.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' UPDATE pessoa SET nome = :nome, documento = :documento, email = :email,             ');
    SQL.Add(' data_nascimento = :data_nascimento, data_consulta_receita = :data_consulta_receita, ');
    SQL.Add(' situacao_cadastral_receita = :situacao_cadastral_receita                            ');
    SQL.Add(' WHERE id = :id                                                                      ');
    ParamByName('nome').AsString := edtNome.Text;
    ParamByName('documento').AsString := edtCPF.Text;
    ParamByName('email').AsString := edtEmail.Text;
    ParamByName('data_nascimento').AsDate := edtDataNascimento.Date;
    ParamByName('data_consulta_receita').AsDate :=
      StrToDate(edtDataConsulta.Text);
    ParamByName('situacao_cadastral_receita').AsString :=
      edtSituacaoCadastral.Text;
    ParamByName('id').AsInteger := StrToIntDef(edtID.Text, 0);
    ExecSQL;
  end;

end;

procedure TfrmPrincipal.btnAlterarClick(Sender: TObject);
begin
  Alterar;
  LimparCampos;
end;

procedure TfrmPrincipal.btnCadastrarClick(Sender: TObject);
begin
  if Cadastrar then
  begin
    AjustaParametrosDeEnvio;
    ACBrMail1.Send(False);
    LimparCampos;
  end;
end;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
  edtNome.SetFocus;
end;

procedure TfrmPrincipal.btnConsultaCPFClick(Sender: TObject);
begin
  frmConsultaCPF.ShowModal;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir o Cliente ' + edtNome.Text + ' ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Excluir;
    LimparCampos;
  end;
end;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  frmPesquisar.ShowModal;
end;

procedure TfrmPrincipal.btnEnviarEmailClick(Sender: TObject);
begin
  AjustaParametrosDeEnvio;
  ACBrMail1.Send(False);
end;

function TfrmPrincipal.Cadastrar: Boolean;
begin
  try
    with DM.Query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO pessoa (nome, documento, email, data_nascimento, data_consulta_receita, situacao_cadastral_receita) ');
      SQL.Add(' VALUES (:nome, :documento, :email, :data_nascimento, :data_consulta_receita, :situacao_cadastral_receita)      ');
      ParamByName('nome').AsString := edtNome.Text;
      ParamByName('documento').AsString := edtCPF.Text;
      ParamByName('email').AsString := edtEmail.Text;
      ParamByName('data_nascimento').AsDate := edtDataNascimento.Date;
      ParamByName('data_consulta_receita').AsDate :=
        StrToDate(edtDataConsulta.Text);
      ParamByName('situacao_cadastral_receita').AsString :=
        edtSituacaoCadastral.Text;
      ExecSQL;
      Cadastrar := True;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Problemas ao realizar cadastro: ' + E.Message);
      Cadastrar := False;
    end;
  end;

end;

procedure TfrmPrincipal.Carregar;
begin
  with DM.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT nome, documento, email, data_nascimento,   ');
    SQL.Add(' data_consulta_receita, situacao_cadastral_receita ');
    SQL.Add(' FROM pessoa WHERE id = :id                        ');
    ParamByName('id').AsInteger := StrToIntDef(edtID.Text, 0);
    Open;

    if DM.Query.RecordCount > 0 then
    begin
      edtNome.Text := FieldByName('nome').AsString;
      edtCPF.Text := FieldByName('documento').AsString;
      edtDataNascimento.Date := FieldByName('data_nascimento').AsDateTime;
      edtDataConsulta.Text := DateToStr(FieldByName('data_consulta_receita')
        .AsDateTime);
      edtSituacaoCadastral.Text :=
        FieldByName('situacao_cadastral_receita').AsString;
      edtEmail.Text := FieldByName('email').AsString;
      Open;
    end
    else
      ShowMessage('Nenhum Cliente Encontrado!');

  end;
end;

procedure TfrmPrincipal.CarregarCodigo;
begin
  with DM.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT GEN_ID( gen_id_pessoa, 0)+1 FROM RDB$DATABASE ');
    Open;
    edtID.Text := IntToStr(FieldByName('add').AsInteger)
  end;
end;

procedure TfrmPrincipal.edtCPFExit(Sender: TObject);
begin
  if not ValidarCPF(edtCPF.Text) then
  begin
    ShowMessage('CPF Inválido!');
    edtCPF.Clear;
  end;
end;

procedure TfrmPrincipal.edtIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Carregar;
    btnCadastrar.Enabled := False;
  end;
end;

procedure TfrmPrincipal.Email1Click(Sender: TObject);
begin
  frmConfigEmail.ShowModal;
end;

procedure TfrmPrincipal.Excluir;
begin
  with DM.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' DELETE FROM pessoa WHERE id = :id ');
    ParamByName('id').AsInteger := StrToIntDef(edtID.Text, 0);
    ExecSQL;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  arq: TStringList;
begin
  if not(FileExists(ExtractFilePath(Application.ExeName) + 'email.json')) then
  begin
    arq := TStringList.Create;
    arq.Text := '';
    arq.SaveToFile(ExtractFilePath(Application.ExeName) + 'email.json');
  end;


procedure TfrmPrincipal.LimparCampos;
begin
  edtNome.Clear;
  edtCPF.Clear;
  edtEmail.Clear;
  edtDataConsulta.Clear;
  edtDataNascimento.Date := Date;
  edtSituacaoCadastral.Clear;
  CarregarCodigo;
  btnCadastrar.Enabled := True;
end;

function TfrmPrincipal.ValidarCPF(CPF: String): Boolean;
var
  dig10, dig11: string;
  s, i, r, peso: integer;
begin
  if ((CPF = '00000000000') or (CPF = '11111111111') or (CPF = '22222222222') or
    (CPF = '33333333333') or (CPF = '44444444444') or (CPF = '55555555555') or
    (CPF = '66666666666') or (CPF = '77777777777') or (CPF = '88888888888') or
    (CPF = '99999999999') or (length(CPF) <> 11)) then
  begin
    ValidarCPF := False;
    Exit;
  end;

  try
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r: 1, dig10);

    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r: 1, dig11);

    if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
      ValidarCPF := True
    else
      ValidarCPF := False;
  except
    ValidarCPF := False
  end;
end;

end.
