unit MonolitoFinanceiro.View.Relatorios.Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TrelPadrao = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    lblNome: TRLLabel;
    DataSource1: TDataSource;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataSet (aValue: TDataSet);
    procedure Preview;
  end;

var
  relPadrao: TrelPadrao;

implementation

uses
  Monolito.Financeiro.Model.Usuarios;

{$R *.dfm}

{ TForm1 }

procedure TrelPadrao.DataSet(aValue: TDataSet);
begin
  DataSource1.DataSet := aValue;
end;

procedure TrelPadrao.Preview;
begin
  RLReport1.Preview;
end;

procedure TrelPadrao.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  lblNome.Caption :=Format('Impresso por %s em %s', [dmUsuarios.GetUsuarioLogado.Nome, FormatDateTime('dd/mm/yyyy', Now)]);
end;

end.
