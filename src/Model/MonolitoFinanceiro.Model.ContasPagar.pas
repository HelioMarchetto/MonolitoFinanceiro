unit MonolitoFinanceiro.Model.ContasPagar;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MonolitoFinanceiro.Model.Conexao;

type
  TdmContasPagar = class(TDataModule)
    sqlContasPagar: TFDQuery;
    dspContasPagar: TDataSetProvider;
    cdsContasPagar: TClientDataSet;
    cdsContasPagarid: TStringField;
    cdsContasPagarnumero_documento: TStringField;
    cdsContasPagardescricao: TStringField;
    cdsContasPagarparcela: TIntegerField;
    cdsContasPagarvalor_parcela: TFMTBCDField;
    cdsContasPagarvalor_compra: TFMTBCDField;
    cdsContasPagarvalor_abatido: TFMTBCDField;
    cdsContasPagardata_compra: TDateField;
    cdsContasPagardata_cadastro: TDateField;
    cdsContasPagardata_vencimento: TDateField;
    cdsContasPagardata_pagamento: TDateField;
    cdsContasPagarstatus: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmContasPagar: TdmContasPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
