unit MonolitoFinanceiro.View.Relatorios.PadraoAgrupado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TrelPadraoAgrupado = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLBand5: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    lblNome: TRLLabel;
    DataSource1: TDataSource;
  private
    { Private declarations }
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  public
    { Public declarations }
    procedure DataSet (aValue: TDataSet);
    procedure Preview;
  end;

var
  relPadraoAgrupado: TrelPadraoAgrupado;

implementation

uses
  Monolito.Financeiro.Model.Usuarios;

{$R *.dfm}

{ TrelPadraoAgrupado }

procedure TrelPadraoAgrupado.DataSet(aValue: TDataSet);
begin
  DataSource1.DataSet := aValue;
end;

procedure TrelPadraoAgrupado.Preview;
begin
  RLReport1.Preview;
end;

procedure TrelPadraoAgrupado.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lblNome.Caption :=Format('Impresso por %s em %s', [dmUsuarios.GetUsuarioLogado.Nome, FormatDateTime('dd/mm/yyyy', Now)]);
end;

end.
