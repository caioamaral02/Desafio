object frmPesquisar: TfrmPesquisar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisar'
  ClientHeight = 400
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 817
    Height = 41
    Caption = 'Tipo Pesquisa'
    TabOrder = 0
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 80
    Width = 817
    Height = 265
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    OnKeyDown = DBGridKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'ID'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'documento'
        Title.Caption = 'Documento'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_nascimento'
        Title.Caption = 'Data Nascimento'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'situacao_cadastral_receita'
        Title.Caption = 'Situa'#231#227'o Cadastral'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'E-mail'
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_consulta_receita'
        Title.Caption = 'Data Consulta'
        Width = 76
        Visible = True
      end>
  end
  object rbID: TRadioButton
    Left = 40
    Top = 24
    Width = 113
    Height = 17
    Caption = 'ID'
    TabOrder = 2
    OnClick = rbIDClick
  end
  object rbNome: TRadioButton
    Left = 96
    Top = 24
    Width = 113
    Height = 17
    Caption = 'Nome'
    TabOrder = 3
    OnClick = rbNomeClick
  end
  object rbDtNascimento: TRadioButton
    Left = 255
    Top = 24
    Width = 113
    Height = 17
    Caption = 'Data Nascimento'
    TabOrder = 4
    OnClick = rbDtNascimentoClick
  end
  object edtPesquisa: TMaskEdit
    Left = 8
    Top = 56
    Width = 817
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    Text = ''
    OnKeyDown = edtPesquisaKeyDown
  end
  object rbDocumento: TRadioButton
    Left = 167
    Top = 24
    Width = 82
    Height = 17
    Caption = 'Documento'
    TabOrder = 6
    OnClick = rbDocumentoClick
  end
  object rbSituacaoCad: TRadioButton
    Left = 366
    Top = 24
    Width = 113
    Height = 17
    Caption = 'Situa'#231#227'o Cadastral'
    TabOrder = 7
    OnClick = rbSituacaoCadClick
  end
  object rbTodos: TRadioButton
    Left = 485
    Top = 24
    Width = 60
    Height = 17
    Caption = 'Todos'
    Checked = True
    TabOrder = 8
    TabStop = True
  end
  object btnPesquisar: TBitBtn
    Left = 750
    Top = 355
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
    TabOrder = 9
    OnClick = btnPesquisarClick
  end
end
