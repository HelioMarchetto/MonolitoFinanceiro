unit MonolitoFinanceiro.Model.ContasReceber;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmContasReceber = class(TDataModule)
    sqlContasReceber: TFDQuery;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    cdsContasReceberid: TStringField;
    cdsContasRecebernumero_documento: TStringField;
    cdsContasReceberdescricao: TStringField;
    cdsContasReceberparcela: TIntegerField;
    cdsContasRecebervalor_parcela: TFMTBCDField;
    cdsContasRecebervalor_venda: TFMTBCDField;
    cdsContasRecebervalor_abatido: TFMTBCDField;
    cdsContasReceberdata_venda: TDateField;
    cdsContasReceberdata_cadastro: TDateField;
    cdsContasReceberdata_vencimento: TDateField;
    cdsContasReceberdata_recebimento: TDateField;
    cdsContasReceberstatus: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmContasReceber: TdmContasReceber;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}

end.
