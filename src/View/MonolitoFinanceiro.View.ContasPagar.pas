unit MonolitoFinanceiro.View.ContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, MonolitoFinanceiro.Model.Conexao, MonolitoFinanceiro.Model.ContasPagar,
  Vcl.ComCtrls, Vcl.WinXCtrls, Datasnap.DBClient;

type
  TfrmContasPagar = class(TfrmCadastroPadrao)
    edtDescricao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtValorCompra: TEdit;
    Label4: TLabel;
    dateCompra: TDateTimePicker;
    toggleParcelamento: TToggleSwitch;
    Label9: TLabel;
    cardParcela: TCardPanel;
    cardParcelaUnica: TCard;
    Label5: TLabel;
    edtNumeroDoc: TEdit;
    Label6: TLabel;
    edtParcela: TEdit;
    edtValorParcela: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    dateVencimento: TDateTimePicker;
    cardParcelamento: TCard;
    Label10: TLabel;
    edtQtdParcelas: TEdit;
    Label11: TLabel;
    edtIntervaloDias: TEdit;
    btnGerar: TButton;
    btnLimpar: TButton;
    DBGrid2: TDBGrid;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsParcelasParcela: TIntegerField;
    cdsParcelasValor: TCurrencyField;
    cdsParcelasVencimento: TDateField;
    cdsParcelasDocumento: TStringField;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure toggleParcelamentoClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorCompraExit(Sender: TObject);
    procedure edtValorParcelaExit(Sender: TObject);
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
  frmContasPagar: TfrmContasPagar;

implementation

uses
  Monolito.Financeiro.Utilitarios,
  System.DateUtils;

{$R *.dfm}

{ TfrmContasPagar }

procedure TfrmContasPagar.btnAlterarClick(Sender: TObject);
begin
  if dmContasPagar.cdsContasPagarstatus.AsString = 'B' then
  begin
    Application.MessageBox('O Documento já foi baixado e não pode ser alterado.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if dmContasPagar.cdsContasPagarstatus.AsString = 'C' then
  begin
    Application.MessageBox('O Documento já foi cancelado e não pode ser alterado.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  inherited;

  toggleParcelamento.Enabled := False;
  toggleParcelamento.State := tssOff;
  cardParcela.ActiveCard := cardParcelaUnica;
  cdsParcelas.EmptyDataSet;

  edtNumeroDoc.Text := dmContasPagar.cdsContasPagarnumero_documento.AsString;
  edtDescricao.Text := dmContasPagar.cdsContasPagardescricao.AsString;
  edtValorCompra.Text := TUtilitarios.FormatarValor(dmContasPagar.cdsContasPagarvalor_compra.AsCurrency);
  dateCompra.Date := dmContasPagar.cdsContasPagardata_compra.AsDateTime;
  edtParcela.Text := dmContasPagar.cdsContasPagarparcela.AsString;
  edtValorParcela.Text := TUtilitarios.FormatarValor(dmContasPagar.cdsContasPagarvalor_parcela.AsCurrency);
  dateVencimento.Date := dmContasPagar.cdsContasPagardata_vencimento.AsDateTime;
end;

procedure TfrmContasPagar.btnExcluirClick(Sender: TObject);
begin
  if dmContasPagar.cdsContasPagarstatus.AsString = 'C' then
  begin
    Application.MessageBox('O Documento já se encontra cancelado.', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Application.MessageBox('Deseja realmente cancelar esse documento', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    dmContasPagar.cdsContasPagar.Edit;
    dmContasPagar.cdsContasPagarstatus.AsString := 'C';
    dmContasPagar.cdsContasPagar.Post;
    dmContasPagar.cdsContasPagar.ApplyUpdates(0);
    Application.MessageBox('Documento cancelado com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Pesquisar;
  except on E : Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao cancelar documento', MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmContasPagar.btnGerarClick(Sender: TObject);
var
  Contador: Integer;
  LQuantidadeParcelas: Integer;
  LIntervaloDias: Integer;
  LValorCompra: Currency;
  LValorParcela: Currency;
  LValorResiduo: Currency;
begin
  if not TryStrToCurr(edtValorCompra.Text, LValorCompra) then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da compra inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
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

  LValorParcela := TUtilitarios.TruncarValor(LValorCompra / LQuantidadeParcelas);// * 100)) / 100;
  LValorResiduo := LValorCompra - (LValorParcela * LQuantidadeParcelas);

  cdsParcelas.EmptyDataSet;
  for Contador := 1 to LQuantidadeParcelas do
  begin
    cdsParcelas.Insert;
    cdsParcelasParcela.AsInteger := Contador;
    cdsParcelasValor.AsCurrency := LValorParcela + LValorResiduo;
    LValorResiduo := 0;
    cdsParcelasVencimento.AsDateTime := IncDay(dateCompra.Date, LIntervaloDias * Contador);

  end;

end;

procedure TfrmContasPagar.btnIncluirClick(Sender: TObject);
begin
  inherited;
  dateCompra.Date := Now;
  dateVencimento.Date := Now;

  toggleParcelamento.Enabled := True;
  toggleParcelamento.State := tssOff;
  cardParcela.ActiveCard := cardParcelaUnica;
  cdsParcelas.EmptyDataSet;
end;

procedure TfrmContasPagar.btnLimparClick(Sender: TObject);
begin
  cdsParcelas.EmptyDataSet;
end;

procedure TfrmContasPagar.btnSalvarClick(Sender: TObject);
begin
  if toggleParcelamento.State = tssOff then
  begin
    CadastrarParcelaUnica;
    inherited;
  end
  else
    CadastrarParcelamento;

end;

procedure TfrmContasPagar.CadastrarParcelamento;
var
  LValorCompra : Currency;
begin

  if not TryStrToCurr(edtValorCompra.Text, LValorCompra) then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da compra inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
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
      if dmContasPagar.cdsContasPagar.State in [dsBrowse, dsInactive] then
        dmContasPagar.cdsContasPagar.Insert;

      dmContasPagar.cdsContasPagarid.AsString := TUtilitarios.GetID;
      dmContasPagar.cdsContasPagardata_cadastro.AsDateTime := Now;
      dmContasPagar.cdsContasPagarstatus.AsString := 'A';
      dmContasPagar.cdsContasPagarvalor_abatido.AsCurrency := 0;

      dmContasPagar.cdsContasPagarnumero_documento.AsString := cdsParcelasDocumento.AsString;
      dmContasPagar.cdsContasPagardescricao.AsString := Format('%s - Parcela %d', [edtDescricao.Text, cdsParcelasParcela.AsInteger]);
      dmContasPagar.cdsContasPagarvalor_compra.AsCurrency := LValorCompra;
      dmContasPagar.cdsContasPagarparcela.AsInteger := cdsParcelasParcela.AsInteger;
      dmContasPagar.cdsContasPagarvalor_parcela.AsCurrency := cdsParcelasValor.AsCurrency;
      dmContasPagar.cdsContasPagardata_vencimento.AsDateTime := cdsParcelasVencimento.AsDateTime;
      dmContasPagar.cdsContasPagardata_compra.AsDateTime := dateCompra.Date;
      dmContasPagar.cdsContasPagar.Post;
      dmContasPagar.cdsContasPagar.ApplyUpdates(0);

      cdsParcelas.Next;
    end;

    Application.MessageBox('Parcelas cadastradas com sucesso.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Pesquisar;
    PnlPrincipal.ActiveCard := cardPesquisa;
end;

procedure TfrmContasPagar.CadastrarParcelaUnica;
var
  LParcela : Integer;
  LValorCompra : Currency;
  LValorParcela : Currency;
begin
  if edtNumeroDoc.Text = '' then
  begin
    edtNumeroDoc.SetFocus;
    Application.MessageBox('O campo Nº Documento não pode ser vazio.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if not TryStrToCurr(edtValorCompra.Text, LValorCompra) then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da compra inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if not TryStrToInt(edtParcela.Text, LParcela) then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('Nº da parcela inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if not TryStrToCurr(edtValorParcela.Text, LValorParcela) then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da parcela inválido.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if dateVencimento.Date < dateCompra.Date then
  begin
    dateVencimento.SetFocus;
    Application.MessageBox('A data de Vencimento não pode ser inferior a data de Compra.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if DataSource1.State in [dsInsert] then
  begin
    dmContasPagar.cdsContasPagarid.AsString := TUtilitarios.GetID;
    dmContasPagar.cdsContasPagardata_cadastro.AsDateTime := Now;
    dmContasPagar.cdsContasPagarstatus.AsString := 'A';
    dmContasPagar.cdsContasPagarvalor_abatido.AsCurrency := 0;
  end;

  dmContasPagar.cdsContasPagarnumero_documento.AsString := edtNumeroDoc.Text;
  dmContasPagar.cdsContasPagardescricao.AsString := edtDescricao.Text;
  dmContasPagar.cdsContasPagarvalor_compra.AsCurrency := LValorCompra;
  dmContasPagar.cdsContasPagarparcela.AsInteger := LParcela;
  dmContasPagar.cdsContasPagarvalor_parcela.AsCurrency := LValorParcela;
  dmContasPagar.cdsContasPagardata_vencimento.AsDateTime := dateVencimento.DateTime;
  dmContasPagar.cdsContasPagardata_compra.AsDateTime := dateCompra.Date;

end;

procedure TfrmContasPagar.edtValorCompraExit(Sender: TObject);
begin
  edtValorCompra.Text := TUtilitarios.FormatarValor(edtValorCompra.Text);
end;

procedure TfrmContasPagar.edtValorParcelaExit(Sender: TObject);
begin
  edtValorParcela.Text := TUtilitarios.FormatarValor(edtValorParcela.Text);
end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  inherited;
  edtValorCompra.OnKeyPress := TUtilitarios.KeyPressValor;
  edtValorParcela.OnKeyPress := TUtilitarios.KeyPressValor;
end;

procedure TfrmContasPagar.Pesquisar;
var
  LFiltroPesquisa : String;
begin
  LFiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);
  dmContasPagar.cdsContasPagar.Close;
  dmContasPagar.cdsContasPagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE 1 = 1' + LFiltroPesquisa;
  dmContasPagar.cdsContasPagar.Open;
  inherited;
end;

procedure TfrmContasPagar.toggleParcelamentoClick(Sender: TObject);
begin
  cardParcela.ActiveCard := cardParcelaUnica;
  if toggleParcelamento.State = tssOn then
    cardParcela.ActiveCard := cardParcelamento;
end;

end.
