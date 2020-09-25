object frmConsultaCPF: TfrmConsultaCPF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta CPF'
  ClientHeight = 191
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 9
    Top = 3
    Width = 346
    Height = 127
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 344
      Height = 106
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
      ExplicitTop = -5
    end
    object LabAtualizarCaptcha: TLabel
      Left = 1
      Top = 107
      Width = 344
      Height = 19
      Cursor = crHandPoint
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 'Atualizar Captcha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = LabAtualizarCaptchaClick
      ExplicitTop = 111
    end
  end
  object EditCaptcha: TEdit
    Left = 8
    Top = 139
    Width = 221
    Height = 41
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnConsultar: TButton
    Left = 235
    Top = 140
    Width = 120
    Height = 40
    Caption = 'Consultar'
    TabOrder = 2
    OnClick = btnConsultarClick
  end
  object ACBrConsultaCPF1: TACBrConsultaCPF
    ProxyPort = '8080'
    Left = 9
    Top = 187
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 54
    Top = 184
  end
end
