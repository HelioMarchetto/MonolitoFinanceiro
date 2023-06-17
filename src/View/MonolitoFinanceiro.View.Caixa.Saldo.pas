unit MonolitoFinanceiro.View.Caixa.Saldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.WinXPanels;

type
  TfrmCaixaSaldo = class(TForm)
    pnlPrincipal: TPanel;
    pnlPesquisar: TPanel;
    pnlContent: TPanel;
    Button1: TButton;
    ImageList1: TImageList;
    dateInicial: TDateTimePicker;
    dateFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    StackPanel1: TStackPanel;
    Panel1: TPanel;
    lblSaldoFinalNome: TLabel;
    lblSaldoFinal: TLabel;
    Panel2: TPanel;
    lblSaldoParcialNome: TLabel;
    lblSaldoParcial: TLabel;
    Panel3: TPanel;
    lblTotalSaidasNome: TLabel;
    lblTotalSaidas: TLabel;
    Panel4: TPanel;
    lblTotalEntradasNome: TLabel;
    lblTotalEntradas: TLabel;
    Panel5: TPanel;
    lblSaldoInicialNome: TLabel;
    lblSaldoInicial: TLabel;
    pnlLineHeader: TPanel;
    Panel6: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  frmCaixaSaldo: TfrmCaixaSaldo;

implementation

uses
  MonolitoFinanceiro.Entidades.Caixa.Resumo, MonolitoFinanceiro.Model.Caixa, 
  System.SysUtils, MonolitoFinanceiro.Model.Conexao, System.DateUtils,
  MonolitoFinanceiro.View.Caixa, Monolito.Financeiro.Utilitarios;

{$R *.dfm}

{ TfrmCaixaSaldo }

procedure TfrmCaixaSaldo.Button1Click(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCaixaSaldo.FormShow(Sender: TObject);
begin
  dateInicial.Date := IncDay(Now, - 7);
  dateFinal.Date := Now;
  Pesquisar;
end;

procedure TfrmCaixaSaldo.Pesquisar;
var
  ResumoCaixa : TModelResumoCaixa;
begin
  lblSaldoInicial.Caption := '';
  lblTotalEntradas.Caption := '';
  lblTotalSaidas.Caption := '';
  lblSaldoParcial.Caption := '';
  lblSaldoFinal.Caption := '';

  ResumoCaixa := dmCaixa.ResumoCaixa(dateInicial.Date, dateFinal.Date);
  try
    lblSaldoInicial.Caption := TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoInicial);
    lblTotalEntradas.Caption :=  TUtilitarios.FormatoMoeda(ResumoCaixa.TotalEntradas);
    lblTotalSaidas.Caption :=  TUtilitarios.FormatoMoeda(ResumoCaixa.TotalSaidas);
    lblSaldoParcial.Caption :=  TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoParcial);
    lblSaldoFinal.Caption :=  TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoFinal);
  finally
    ResumoCaixa.Free;
  end;
end;

end.
