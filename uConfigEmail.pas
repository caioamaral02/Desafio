unit uConfigEmail;

interface

type
  TConfigEmail = class
  private
    FHostsmtp: String;
    FUsuariosmtp: String;
    FSenha: String;
    FSsl: Boolean;
    FTls: Boolean;
    FPorta: String;
    procedure SetHostsmtp(const Value: String);
    procedure SetPorta(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetSsl(const Value: Boolean);
    procedure SetTls(const Value: Boolean);
    procedure SetUsuariosmtp(const Value: String);

  public
    property Hostsmtp: String read FHostsmtp write SetHostsmtp;
    property Porta: String read FPorta write SetPorta;
    property Usuariosmtp: String read FUsuariosmtp write SetUsuariosmtp;
    property Senha: String read FSenha write SetSenha;
    property Ssl: Boolean read FSsl write SetSsl;
    property Tls: Boolean read FTls write SetTls;

  end;

implementation

{ TConfigEmail }

procedure TConfigEmail.SetHostsmtp(const Value: String);
begin
  FHostsmtp := Value;
end;

procedure TConfigEmail.SetPorta(const Value: String);
begin
  FPorta := Value;
end;

procedure TConfigEmail.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TConfigEmail.SetSsl(const Value: Boolean);
begin
  FSsl := Value;
end;

procedure TConfigEmail.SetTls(const Value: Boolean);
begin
  FTls := Value;
end;

procedure TConfigEmail.SetUsuariosmtp(const Value: String);
begin
  FUsuariosmtp := Value;
end;

end.
