unit uPesquisar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.WinXPickers,
  Vcl.Buttons;

type
  TfrmPesquisar = class(TForm)
    RadioGroup1: TRadioGroup;
    DBGrid: TDBGrid;
    rbID: TRadioButton;
    rbNome: TRadioButton;
    rbDtNascimento: TRadioButton;
    edtPesquisa: TMaskEdit;
    rbDocumento: TRadioButton;
    rbSituacaoCad: TRadioButton;
    rbTodos: TRadioButton;
    btnPesquisar: TBitBtn;
    procedure rbDocumentoClick(Sender: TObject);
    procedure rbDtNascimentoClick(Sender: TObject);
    procedure rbIDClick(Sender: TObject);
    procedure rbNomeClick(Sender: TObject);
    procedure rbSituacaoCadClick(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure Carregar;

  public
    { Public declarations }
  end;

var
  frmPesquisar: TfrmPesquisar;

implementation

{$R *.dfm}

uses uDM, uPrincipal;

procedure TfrmPesquisar.btnPesquisarClick(Sender: TObject);
begin
  with DM.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT * FROM pessoa');

    if rbID.Checked then
    begin
      SQL.Add(' WHERE id = :pesquisa');
      ParamByName('pesquisa').AsInteger := StrToIntDef(edtPesquisa.Text, 0);
    end;

    if rbNome.Checked then
    begin
      SQL.Add(' WHERE nome like ''%' + edtPesquisa.Text + '%''');
    end;

    if rbDocumento.Checked then
    begin
      SQL.Add(' WHERE documento = :pesquisa');
      ParamByName('pesquisa').AsString := edtPesquisa.Text;
    end;

    if rbDtNascimento.Checked then
    begin
      SQL.Add(' WHERE data_nascimento = :pesquisa');
      ParamByName('pesquisa').AsDate :=
        StrToDate(Copy(edtPesquisa.Text, 1, 2) + '/' + Copy(edtPesquisa.Text, 3,
        2) + '/' + Copy(edtPesquisa.Text, 5, 4));
    end;

    if rbSituacaoCad.Checked then
    begin
      SQL.Add(' WHERE situacao_cadastral_receita = :pesquisa');
      ParamByName('pesquisa').AsString := edtPesquisa.Text;
    end;

    Open;
  end;

  DBGrid.DataSource := DM.DataSource;
  DM.DataSource.DataSet := DM.Query;
end;

procedure TfrmPesquisar.Carregar;
begin
  frmPrincipal.edtID.Text := IntToStr(DM.DataSource.DataSet.FieldByName('id')
    .AsInteger);
  frmPrincipal.edtNome.Text := DM.DataSource.DataSet.FieldByName
    ('nome').AsString;
  frmPrincipal.edtCPF.Text := DM.DataSource.DataSet.FieldByName
    ('documento').AsString;
  frmPrincipal.edtDataNascimento.Date := DM.DataSource.DataSet.FieldByName
    ('data_nascimento').AsDateTime;
  frmPrincipal.edtSituacaoCadastral.Text := DM.DataSource.DataSet.FieldByName
    ('situacao_cadastral_receita').AsString;
  frmPrincipal.edtDataConsulta.Text := DM.DataSource.DataSet.FieldByName
    ('data_consulta_receita').AsString;
  frmPrincipal.edtEmail.Text := DM.DataSource.DataSet.FieldByName
    ('email').AsString;
  Close;
end;

procedure TfrmPesquisar.DBGridDblClick(Sender: TObject);
begin
  Carregar;
end;

procedure TfrmPesquisar.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Carregar;
end;

procedure TfrmPesquisar.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnPesquisar.Click;
  end;
end;

procedure TfrmPesquisar.rbIDClick(Sender: TObject);
begin
  edtPesquisa.Clear;
  edtPesquisa.EditMask := '';
  edtPesquisa.SetFocus;
end;

procedure TfrmPesquisar.rbNomeClick(Sender: TObject);
begin
  edtPesquisa.Clear;
  edtPesquisa.EditMask := '';
  edtPesquisa.SetFocus;
end;

procedure TfrmPesquisar.rbSituacaoCadClick(Sender: TObject);
begin
  edtPesquisa.Clear;
  edtPesquisa.EditMask := '';
  edtPesquisa.SetFocus;
end;

procedure TfrmPesquisar.rbDocumentoClick(Sender: TObject);
begin
  edtPesquisa.Clear;
  edtPesquisa.EditMask := '!999.999.999-99;0 ';
  edtPesquisa.SetFocus;
end;

procedure TfrmPesquisar.rbDtNascimentoClick(Sender: TObject);
begin
  edtPesquisa.Clear;
  edtPesquisa.EditMask := '!99/99/9999;0; ';
  edtPesquisa.SetFocus;
end;

end.
