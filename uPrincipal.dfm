object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 148
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 50
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label2: TLabel
    Left = 136
    Top = 50
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
  end
  object Label3: TLabel
    Left = 331
    Top = 52
    Width = 68
    Height = 13
    Caption = 'Data Consulta'
  end
  object Label4: TLabel
    Left = 416
    Top = 51
    Width = 90
    Height = 13
    Caption = 'Situa'#231#227'o Cadastral'
  end
  object edtID: TLabeledEdit
    Left = 8
    Top = 24
    Width = 57
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    TabOrder = 0
    OnKeyDown = edtIDKeyDown
  end
  object edtNome: TLabeledEdit
    Left = 80
    Top = 24
    Width = 241
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 1
  end
  object edtCPF: TMaskEdit
    Left = 8
    Top = 67
    Width = 112
    Height = 21
    EditMask = '!999.999.999-99;0; '
    MaxLength = 14
    TabOrder = 2
    Text = ''
    OnExit = edtCPFExit
  end
  object edtEmail: TLabeledEdit
    Left = 327
    Top = 25
    Width = 202
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'E-mail'
    TabOrder = 3
  end
  object btnConsultaCPF: TBitBtn
    Left = 246
    Top = 67
    Width = 75
    Height = 22
    Glyph.Data = {
      E6040000424DE604000000000000360000002800000014000000140000000100
      180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC6C6C60D0D0D515151FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6
      C6C60E0E0E0000000D0D0DD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C70E0E0E0000
      000E0E0EC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C80E0E0E0000000E0E0EC7C7C7
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDC7C7C79C9C9C949494B1B1
      B1EEEEEEFFFFFFFFFFFFC8C8C80E0E0E0000000E0E0EC7C7C7FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9A9A9A1D1D1D000000000000000000000000060606
      646464ECECEC3939390000000E0E0EC8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFAFAFA5555550000000000000101012727273232320D0D0D0000000000001B
      1B1B0C0C0C393939C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6A6A
      000000000000676767E4E4E4FFFFFFFFFFFFFBFBFBA7A7A71818180000001B1B
      1BECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA0000000000008A
      8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0181818000000646464
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F0000003A3A3AFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7000000060606EEEEEEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1E1E0000009B9B9BFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB0D0D0D000000B1B1B1FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF030303000000C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF323232000000949494FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0B0B0B000000B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF2727270000009C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF353535000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE4E4E4010101000000C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888
      88000000121212E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67
      67670000001D1D1DFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0171717
      000000343434E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A0000000000
      009A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC06060600
      0000121212797979B8B8B8C3C3C39B9B9B3A3A3A000000000000555555FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC1717170000
      000000000000000000000000000000000101016A6A6AFAFAFAFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0888888353535
      0B0B0B0303031E1E1E5F5F5FCACACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF}
    TabOrder = 4
    OnClick = btnConsultaCPFClick
  end
  object edtDataConsulta: TMaskEdit
    Left = 330
    Top = 67
    Width = 81
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 5
    Text = ''
  end
  object btnCadastrar: TButton
    Left = 8
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 6
    OnClick = btnCadastrarClick
  end
  object edtDataNascimento: TDateTimePicker
    Left = 136
    Top = 67
    Width = 96
    Height = 21
    Date = 44098.000000000000000000
    Time = 0.022961921298701780
    TabOrder = 7
  end
  object btnAlterar: TButton
    Left = 97
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 8
    OnClick = btnAlterarClick
  end
  object edtSituacaoCadastral: TEdit
    Left = 417
    Top = 67
    Width = 112
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object btnCancelar: TButton
    Left = 365
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 10
    OnClick = btnCancelarClick
  end
  object btnExcluir: TButton
    Left = 186
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 11
    OnClick = btnExcluirClick
  end
  object btnEnviarEmail: TButton
    Left = 454
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Enviar Email'
    TabOrder = 12
    OnClick = btnEnviarEmailClick
  end
  object btnPesquisar: TButton
    Left = 276
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 13
    OnClick = btnPesquisarClick
  end
  object mmAssunto: TMemo
    Left = 8
    Top = 232
    Width = 527
    Height = 25
    Enabled = False
    Lines.Strings = (
      'mmAssunto')
    TabOrder = 14
  end
  object ACBrConsultaCPF1: TACBrConsultaCPF
    ProxyPort = '8080'
    CPF = '11293674605'
    DataNascimento = '27101992'
    Left = 432
    Top = 232
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    OnMailProcess = ACBrMail1MailProcess
    Left = 472
    Top = 230
  end
  object MainMenu1: TMainMenu
    Left = 512
    Top = 232
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object Email1: TMenuItem
        Caption = 'Email'
        OnClick = Email1Click
      end
    end
  end
end
