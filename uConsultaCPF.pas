unit uConsultaCPF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ACBrBase,
  ACBrSocket, ACBrConsultaCPF, PNGImage;

type
  TfrmConsultaCPF = class(TForm)
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    EditCaptcha: TEdit;
    btnConsultar: TButton;
    ACBrConsultaCPF1: TACBrConsultaCPF;
    Timer1: TTimer;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Cpf, DataNascimento: String;
  public
    { Public declarations }
  end;

var
  frmConsultaCPF: TfrmConsultaCPF;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmConsultaCPF.btnConsultarClick(Sender: TObject);
begin
  if EditCaptcha.Text <> '' then
  begin
    if ACBrConsultaCPF1.Consulta(Cpf, DataNascimento, EditCaptcha.Text) then
    begin
      frmPrincipal.edtNome.Text := ACBrConsultaCPF1.Nome;
      frmPrincipal.edtSituacaoCadastral.Text := ACBrConsultaCPF1.Situacao;
      frmPrincipal.edtDataConsulta.Text :=
        Copy(ACBrConsultaCPF1.Emissao, 17, 10);
      Close;
      frmPrincipal.edtEmail.SetFocus;
    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;
end;

procedure TfrmConsultaCPF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cpf := '';
  DataNascimento := '';
end;

procedure TfrmConsultaCPF.FormShow(Sender: TObject);
begin
  Cpf := frmPrincipal.edtCPF.Text;
  DataNascimento := DateToStr(frmPrincipal.edtDataNascimento.Date);
  Timer1.Enabled := True;
  EditCaptcha.SetFocus;
end;

procedure TfrmConsultaCPF.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  Stream := TMemoryStream.Create;
  try
    ACBrConsultaCPF1.Captcha(Stream);
    ImgArq := ExtractFilePath(ParamStr(0)) + PathDelim + 'captch.png';
    Stream.SaveToFile(ImgArq);
    Image1.Picture.LoadFromFile(ImgArq);

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TfrmConsultaCPF.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditCaptcha.SetFocus;
end;

end.
