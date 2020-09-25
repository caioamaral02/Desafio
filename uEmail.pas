unit uEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Rest.Json,
  uConfigEmail, System.Json, Vcl.Buttons;

type
  TfrmConfigEmail = class(TForm)
    btnSalvar: TButton;
    Button2: TButton;
    edtHostSMTP: TLabeledEdit;
    edtPorta: TLabeledEdit;
    edtUsuarioSMTP: TLabeledEdit;
    edtSenha: TLabeledEdit;
    Protocolo: TRadioGroup;
    rbTLS: TRadioButton;
    rbSSL: TRadioButton;
    btnVisualizar: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Carregar;
  public
    { Public declarations }
  end;

var
  frmConfigEmail: TfrmConfigEmail;

implementation

{$R *.dfm}

procedure TfrmConfigEmail.btnSalvarClick(Sender: TObject);
var
  ConfigEmail: TConfigEmail;
  arq: TStringList;
begin
  try
    arq := TStringList.Create;
    ConfigEmail := TConfigEmail.Create;

    ConfigEmail.Hostsmtp := edtHostSMTP.Text;
    ConfigEmail.Porta := edtPorta.Text;
    ConfigEmail.Usuariosmtp := edtUsuarioSMTP.Text;
    ConfigEmail.Senha := edtSenha.Text;
    ConfigEmail.Ssl := rbSSL.Checked;
    ConfigEmail.Tls := rbTLS.Checked;

    arq.Text := TJson.ObjectToJsonString(ConfigEmail);
    arq.SaveToFile(ExtractFilePath(Application.ExeName) + 'email.json');
    ShowMessage('Dados gravados com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao gravar dados ' + E.Message);
  end;

end;

procedure TfrmConfigEmail.btnVisualizarClick(Sender: TObject);
begin
  if edtSenha.PasswordChar = '*' then
  begin
    edtSenha.PasswordChar := #0;
  end
  else
    edtSenha.PasswordChar := '*';
end;

procedure TfrmConfigEmail.Button2Click(Sender: TObject);
begin
  edtHostSMTP.Clear;
  edtPorta.Clear;
  edtUsuarioSMTP.Clear;
  edtSenha.Clear;
end;

procedure TfrmConfigEmail.Carregar;
var
  jsonObject: TJSONObject;
  lista: TStringList;
  jsonValue: TJSONValue;
  jsonString: TJSONString;
  par: TJSONPair;
  ConfigEmail: TConfigEmail;
begin
  ConfigEmail := TConfigEmail.Create;
  jsonObject := TJSONObject.Create;
  par := TJSONPair.Create;
  lista := TStringList.Create;
  jsonValue := TJSONObject.Create;

  lista.LoadFromFile(ExtractFilePath(Application.ExeName) + 'email.json');
  jsonValue := TJSONObject.ParseJSONValue(lista.Text);
  jsonObject := jsonValue as TJSONObject;

  for par in jsonObject do
  begin
    if par.jsonString.Value = 'hostsmtp' then
      ConfigEmail.Hostsmtp := par.jsonValue.Value;
    if par.jsonString.Value = 'usuariosmtp' then
      ConfigEmail.Usuariosmtp := par.jsonValue.Value;
    if par.jsonString.Value = 'senha' then
      ConfigEmail.Senha := par.jsonValue.Value;
    if par.jsonString.Value = 'porta' then
      ConfigEmail.Porta := par.jsonValue.Value;
    if par.jsonString.Value = 'ssl' then
      ConfigEmail.Ssl := StrToBool(par.jsonValue.Value);
    if par.jsonString.Value = 'tls' then
      ConfigEmail.Tls := StrToBool(par.jsonValue.Value);
  end;

  edtHostSMTP.Text := ConfigEmail.Hostsmtp;
  edtUsuarioSMTP.Text := ConfigEmail.Usuariosmtp;
  edtSenha.Text := ConfigEmail.Senha;
  edtPorta.Text := ConfigEmail.Porta;
  rbSSL.Checked := ConfigEmail.Ssl;
  rbTLS.Checked := ConfigEmail.Tls;
end;

procedure TfrmConfigEmail.FormCreate(Sender: TObject);
begin
  Carregar;
end;

procedure TfrmConfigEmail.FormShow(Sender: TObject);
begin
  Carregar;
end;

end.
