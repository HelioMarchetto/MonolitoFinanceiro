object dmContasPagar: TdmContasPagar
  OldCreateOrder = False
  Height = 301
  Width = 394
  object sqlContasPagar: TFDQuery
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'SELECT * FROM CONTAS_PAGAR')
    Left = 32
    Top = 24
  end
  object dspContasPagar: TDataSetProvider
    DataSet = sqlContasPagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 24
  end
  object cdsContasPagar: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CONTAS_PAGAR'
    Params = <>
    ProviderName = 'dspContasPagar'
    Left = 216
    Top = 24
    object cdsContasPagarid: TStringField
      FieldName = 'id'
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsContasPagarnumero_documento: TStringField
      FieldName = 'numero_documento'
      Required = True
    end
    object cdsContasPagardescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object cdsContasPagarparcela: TIntegerField
      FieldName = 'parcela'
      Required = True
    end
    object cdsContasPagarvalor_parcela: TFMTBCDField
      FieldName = 'valor_parcela'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasPagarvalor_compra: TFMTBCDField
      FieldName = 'valor_compra'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasPagarvalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasPagardata_compra: TDateField
      FieldName = 'data_compra'
      Required = True
    end
    object cdsContasPagardata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Required = True
    end
    object cdsContasPagardata_vencimento: TDateField
      FieldName = 'data_vencimento'
      Required = True
    end
    object cdsContasPagardata_pagamento: TDateField
      FieldName = 'data_pagamento'
    end
    object cdsContasPagarstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
