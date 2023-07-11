unit MonolitoFinanceiro.View.ContasReceber.Detalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, System.ImageList, Vcl.ImgList, Vcl.StdCtrls;

type
  TfrmContasReceberDetalhes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    btnFechar: TButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblVencimento: TLabel;
    lblNumeroParcela: TLabel;
    lblNumeroDocumento: TLabel;
    Panel9: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel10: TPanel;
    lblValorVenda: TLabel;
    lblValorParcela: TLabel;
    lblDescricao: TLabel;
    Panel12: TPanel;
    lblTotalDetalhes: TLabel;
    lblQuantidadeRegistros: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExibirContasReceberDetalhes(IDContasReceber: string);
  end;

var
  frmContasReceberDetalhes: TfrmContasReceberDetalhes;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.ContasReceber, MonolitoFinanceiro.Entidades.ContaReceber,
  Monolito.Financeiro.Utilitarios;

procedure TfrmContasReceberDetalhes.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmContasReceberDetalhes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TUtilitarios.ZebrarDBGrid(TDBGrid(Sender), Rect, Column, State);
end;

procedure TfrmContasReceberDetalhes.ExibirContasReceberDetalhes(
  IDContasReceber: string);
var
  ContasReceber: TModelContaReceber;
  SQL: string;
begin
  if IDContasReceber.IsEmpty then
    raise Exception.Create('ID do contas a receber inv�lido');

  ContasReceber := dmContasReceber.GetContaReceber(IDContasReceber);
  try
    if ContasReceber.ID.IsEmpty then
      raise Exception.Create('Contas a receber n�o encontrado');

    lblNumeroDocumento.Caption := ContasReceber.Documento;
    lblDescricao.Caption := ContasReceber.Descricao;
    lblVencimento.Caption := FormatDateTime('DD/MM/YYYY', ContasReceber.DataVencimento);
    lblNumeroParcela.Caption := IntToStr(ContasReceber.Parcela);
    lblValorVenda.Caption := TUtilitarios.FormatoMoeda(ContasReceber.ValorVenda);
    lblValorParcela.Caption := TUtilitarios.FormatoMoeda(ContasReceber.ValorParcela);
  finally
    ContasReceber.Free;
  end;

  SQL := 'SELECT * FROM CONTAS_RECEBER_DETALHES' +
      ' LEFT JOIN USUARIOS ON CONTAS_RECEBER_DETALHES.USUARIO = USUARIOS.ID' +
      ' WHERE ID_CONTA_RECEBER = :IDCONTARECEBER';
  dmContasReceber.sqlContasReceber.Close;
  dmContasReceber.sqlContasReceberDetalhes.SQL.Clear;
  dmContasReceber.sqlContasReceberDetalhes.Params.Clear;
  dmContasReceber.sqlContasReceberDetalhes.SQL.Add(SQL);
  dmContasReceber.sqlContasReceberDetalhes.ParamByName('IDCONTARECEBER').AsString := IDContasReceber;
  dmContasReceber.sqlContasReceberDetalhes.Prepare;
  dmContasReceber.sqlContasReceberDetalhes.Open;

  lblQuantidadeRegistros.Caption := Format('Quantidade de Registros: %d', [DataSource1.DataSet.RecordCount]);
  lblTotalDetalhes.Caption := 'Total de Recebimentos: R$ ' + TUtilitarios.FormatarValor(dmContasReceber.sqlContasReceberDetalhes.FieldByName('Total').AsString);

  Self.ShowModal;
end;

end.
