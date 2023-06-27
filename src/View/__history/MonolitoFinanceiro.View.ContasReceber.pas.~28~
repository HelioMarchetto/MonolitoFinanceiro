unit MonolitoFinanceiro.View.ContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Datasnap.DBClient, Vcl.ComCtrls, Vcl.WinXCtrls,
  Vcl.Menus;

type
  TfrmContasReceber = class(TfrmCadastroPadrao)
    dsParcelas: TDataSource;
    cdsParcelas: TClientDataSet;
    cdsParcelasParcela: TIntegerField;
    cdsParcelasDocumento: TStringField;
    cdsParcelasVencimento: TDateField;
    cdsParcelasValor: TCurrencyField;
    edtDescricao: TEdit;
    Label9: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    edtValorVenda: TEdit;
    dateVenda: TDateTimePicker;
    toggleParcelamento: TToggleSwitch;
    cardParcela: TCardPanel;
    cardParcelaUnica: TCard;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNumeroDoc: TEdit;
    edtParcela: TEdit;
    edtValorParcela: TEdit;
    dateVencimento: TDateTimePicker;
    cardParcelamento: TCard;
    Label10: TLabel;
    Label11: TLabel;
    edtQtdParcelas: TEdit;
    edtIntervaloDias: TEdit;
    btnGerar: TButton;
    btnLimpar: TButton;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    mnuBaixar: TMenuItem;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtValorVendaExit(Sender: TObject);
    procedure edtValorParcelaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure toggleParcelamentoClick(Sender: TObject);
    procedure mnuBaixarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CadastrarParcelamento;
    procedure CadastrarParcelaUnica;
  public
    { Public declarations }
    protected
    procedure Pesquisar; override;
  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.ContasReceber,
Monolito.Financeiro.Utilitarios,
System.DateUtils, MonolitoFinanceiro.View.ContasReceber.Baixar;

{ TfrmContasReceber }

procedure TfrmContasReceber.btnAlterarClick(Sender: TObject);
begin
  if dmContasReceber.cdsContasReceberstatus.AsString = 'B' then
  begin
    Application.MessageBox('O Documento já foi baixado e não pode ser alterado.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if  dmContasReceber.cdsContasReceberstatus.AsString = 'C' then
  begin
    Application.MessageBox('O Documento já foi cancelado e não pode ser alterado.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  inherited;

  toggleParcelamento.Enabled := False;
  toggleParcelamento.State := tssOff;
  cardParcela.ActiveCard := cardParcelaUnica;
  cdsParcelas.EmptyDataSet;

  edtNumeroDoc.Text := dmContasReceber.cdsContasRecebernumero_documento.AsString;
  edtDescricao.Text := dmContasReceber.cdsContasReceberdescricao.AsString;
  edtValorVenda.Text := TUtilitarios.FormatarValor(dmContasReceber.cdsContasRecebervalor_venda.AsCurrency);
  dateVenda.Date := dmContasReceber.cdsContasReceberdata_venda.AsDateTime;
  edtParcela.Text := dmContasReceber.cdsContasReceberparcela.AsString;
  edtValorParcela.Text := TUtilitarios.FormatarValor(dmContasReceber.cdsContasRecebervalor_parcela.AsCurrency);
  dateVencimento.Date := dmContasReceber.cdsContasReceberdata_vencimento.AsDateTime;
end;

procedure TfrmContasReceber.btnExcluirClick(Sender: TObject);
begin
  if dmContasReceber.cdsContasReceberstatus.AsString = 'C' then
  begin
    Application.MessageBox('O Documento já se encontra cancelado.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Application.MessageBox('Deseja realmente cancelar esse documento', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    dmContasReceber.cdsContasReceber.Edit;
    dmContasReceber.cdsContasReceberstatus.AsString := 'C';
    dmContasReceber.cdsContasReceber.Post;
    dmContasReceber.cdsContasReceber.ApplyUpdates(0);
    Application.MessageBox('Documento cancelado com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Pesquisar;
  except on E : Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao cancelar documento', MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmContasReceber.btnGerarClick(Sender: TObject);
var
  Contador: Integer;
  LQuantidadeParcelas: Integer;
  LIntervaloDias: Integer;
  LValorVenda: Currency;
  LValorParcela: Currency;
  LValorResiduo: Currency;
begin
  if not TryStrToCurr(edtValorVenda.Text, LValorVenda) then
  begin
    edtValorVenda.SetFocus;
    Application.MessageBox('Valor da venda inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if not TryStrToInt(edtQtdParcelas.Text, LQuantidadeParcelas) then
  begin
    edtQtdParcelas.SetFocus;
    Application.MessageBox('Quantidade de parcelas inválida.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if not TryStrToInt(edtIntervaloDias.Text, LIntervaloDias) then
  begin
    edtIntervaloDias.SetFocus;
    Application.MessageBox('Intervalo em dias inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  LValorParcela := TUtilitarios.TruncarValor(LValorVenda / LQuantidadeParcelas);
  LValorResiduo := LValorVenda - (LValorParcela * LQuantidadeParcelas);

  cdsParcelas.EmptyDataSet;
  for Contador := 1 to LQuantidadeParcelas do
  begin
    cdsParcelas.Insert;
    cdsParcelasParcela.AsInteger := Contador;
    cdsParcelasValor.AsCurrency := LValorParcela + LValorResiduo;
    LValorResiduo := 0;
    cdsParcelasVencimento.AsDateTime := IncDay(dateVenda.Date, LIntervaloDias * Contador);

  end;

end;

procedure TfrmContasReceber.btnIncluirClick(Sender: TObject);
begin
  inherited;
  dateVenda.Date := Now;
  dateVencimento.Date := Now;

  toggleParcelamento.Enabled := True;
  toggleParcelamento.State := tssOff;
  cardParcela.ActiveCard := cardParcelaUnica;
  cdsParcelas.EmptyDataSet;
end;

procedure TfrmContasReceber.btnLimparClick(Sender: TObject);
begin
  cdsParcelas.EmptyDataSet;
end;

procedure TfrmContasReceber.btnSalvarClick(Sender: TObject);
begin
  if toggleParcelamento.State = tssOff then
  begin
    CadastrarParcelaUnica;
    inherited;
  end
  else
    CadastrarParcelamento;
end;

procedure TfrmContasReceber.CadastrarParcelamento;
var
  LValorVenda : Currency;
begin

  if not TryStrToCurr(edtValorVenda.Text, LValorVenda) then
  begin
    edtValorVenda.SetFocus;
    Application.MessageBox('Valor da venda inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  cdsParcelas.First;
    while not cdsParcelas.Eof do
    begin
      if cdsParcelasParcela.AsInteger < 0 then
      begin
        Application.MessageBox('Número da parcela inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
        abort;
      end;
      if cdsParcelasDocumento.AsString = '' then
      begin
        Application.MessageBox('Número do documento inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
        abort;
      end;
      if cdsParcelasValor.AsCurrency < 0.01 then
      begin
        Application.MessageBox('Valor da parcela inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
        abort;
      end;

      cdsParcelas.Next;
    end;

  cdsParcelas.First;
    while not cdsParcelas.Eof do
    begin
      if dmContasReceber.cdsContasReceber.State in [dsBrowse, dsInactive] then
        dmContasReceber.cdsContasReceber.Insert;

      dmContasReceber.cdsContasReceberid.AsString := TUtilitarios.GetID;
      dmContasReceber.cdsContasReceberdata_cadastro.AsDateTime := Now;
      dmContasReceber.cdsContasReceberstatus.AsString := 'A';
      dmContasReceber.cdsContasRecebervalor_abatido.AsCurrency := 0;

      dmContasReceber.cdsContasRecebernumero_documento.AsString := cdsParcelasDocumento.AsString;
      dmContasReceber.cdsContasReceberdescricao.AsString := Format('%s - Parcela %d', [edtDescricao.Text, cdsParcelasParcela.AsInteger]);
      dmContasReceber.cdsContasRecebervalor_venda.AsCurrency := LValorVenda;
      dmContasReceber.cdsContasReceberparcela.AsInteger := cdsParcelasParcela.AsInteger;
      dmContasReceber.cdsContasRecebervalor_parcela.AsCurrency := cdsParcelasValor.AsCurrency;
      dmContasReceber.cdsContasReceberdata_vencimento.AsDateTime := cdsParcelasVencimento.AsDateTime;
      dmContasReceber.cdsContasReceberdata_venda.AsDateTime := dateVenda.Date;
      dmContasReceber.cdsContasReceber.Post;
      dmContasReceber.cdsContasReceber.ApplyUpdates(0);

      cdsParcelas.Next;
    end;

    Application.MessageBox('Parcelas cadastradas com sucesso.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Pesquisar;
    PnlPrincipal.ActiveCard := cardPesquisa;
end;

procedure TfrmContasReceber.CadastrarParcelaUnica;
var
  LParcela : Integer;
  LValorVenda : Currency;
  LValorParcela : Currency;
begin
  if edtNumeroDoc.Text = '' then
  begin
    edtNumeroDoc.SetFocus;
    Application.MessageBox('O campo Nº Documento não pode ser vazio.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if not TryStrToCurr(edtValorVenda.Text, LValorVenda) then
  begin
    edtValorVenda.SetFocus;
    Application.MessageBox('Valor da venda inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if not TryStrToInt(edtParcela.Text, LParcela) then
  begin
    edtValorVenda.SetFocus;
    Application.MessageBox('Nº da parcela inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if not TryStrToCurr(edtValorParcela.Text, LValorParcela) then
  begin
    edtValorVenda.SetFocus;
    Application.MessageBox('Valor da parcela inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if dateVencimento.Date < dateVenda.Date then
  begin
    dateVencimento.SetFocus;
    Application.MessageBox('A data de Vencimento não pode ser inferior a data de Venda.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if DataSource1.State in [dsInsert] then
  begin
    dmContasReceber.cdsContasReceberid.AsString := TUtilitarios.GetID;
    dmContasReceber.cdsContasReceberdata_cadastro.AsDateTime := Now;
    dmContasReceber.cdsContasReceberstatus.AsString := 'A';
    dmContasReceber.cdsContasRecebervalor_abatido.AsCurrency := 0;
  end;

  dmContasReceber.cdsContasRecebernumero_documento.AsString := edtNumeroDoc.Text;
  dmContasReceber.cdsContasReceberdescricao.AsString := edtDescricao.Text;
  dmContasReceber.cdsContasRecebervalor_venda.AsCurrency := LValorVenda;
  dmContasReceber.cdsContasReceberparcela.AsInteger := LParcela;
  dmContasReceber.cdsContasRecebervalor_parcela.AsCurrency := LValorParcela;
  dmContasReceber.cdsContasReceberdata_vencimento.AsDateTime := dateVencimento.DateTime;
  dmContasReceber.cdsContasReceberdata_venda.AsDateTime := dateVenda.Date;
end;

procedure TfrmContasReceber.edtValorParcelaExit(Sender: TObject);
begin
  edtValorParcela.Text := TUtilitarios.FormatarValor(edtValorParcela.Text);
end;

procedure TfrmContasReceber.edtValorVendaExit(Sender: TObject);
begin
  edtValorVenda.Text := TUtilitarios.FormatarValor(edtValorVenda.Text);
end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  edtValorVenda.OnKeyPress := TUtilitarios.KeyPressValor;
  edtValorParcela.OnKeyPress := TUtilitarios.KeyPressValor;
end;

procedure TfrmContasReceber.mnuBaixarClick(Sender: TObject);
begin
  frmContasReceberBaixar.BaixarContaReceber(DataSource1.DataSet.FieldByName('ID').AsString);
  Pesquisar;
end;

procedure TfrmContasReceber.Pesquisar;
var
  LFiltroPesquisa : String;
begin
  LFiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);
  dmContasReceber.cdsContasReceber.Close;
  dmContasReceber.cdsContasReceber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE 1 = 1' + LFiltroPesquisa;
  dmContasReceber.cdsContasReceber.Open;

  inherited;
end;

procedure TfrmContasReceber.toggleParcelamentoClick(Sender: TObject);
begin
  cardParcela.ActiveCard := cardParcelaUnica;
  if toggleParcelamento.State = tssOn then
    cardParcela.ActiveCard := cardParcelamento;
end;

end.
