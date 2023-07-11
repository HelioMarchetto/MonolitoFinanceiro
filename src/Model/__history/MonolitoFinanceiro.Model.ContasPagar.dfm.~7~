object dmContasPagar: TdmContasPagar
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
    AggregatesActive = True
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
    object cdsContasPagarTotal: TAggregateField
      FieldName = 'Total'
      Active = True
      DisplayName = ''
      Expression = 'SUM(valor_parcela)'
    end
  end
  object sqlContasPagarDetalhes: TFDQuery
    AggregatesActive = True
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'SELECT * FROM CONTAS_PAGAR_DETALHES')
    Left = 64
    Top = 88
    object sqlContasPagarDetalhesid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlContasPagarDetalhesid_conta_receber: TStringField
      FieldName = 'id_conta_pagar'
      Origin = 'id_conta_receber'
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlContasPagarDetalhesdetalhes: TStringField
      DisplayLabel = 'Detalhes'
      FieldName = 'detalhes'
      Origin = 'detalhes'
      Required = True
      Size = 200
    end
    object sqlContasPagarDetalhesvalor: TFMTBCDField
      DisplayLabel = 'Valor Abatido'
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      DisplayFormat = 'R$ ,0.00;R$ -,0.00;'
      Precision = 18
      Size = 2
    end
    object sqlContasPagarDetalhesdata: TDateField
      DisplayLabel = 'Data da Baixa'
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object sqlContasPagarDetalhesusuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 50
    end
    object sqlContasPagarDetalhesnome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'nome'
      Size = 50
    end
    object sqlContasPagarDetalhesTotal: TAggregateField
      FieldName = 'Total'
      Active = True
      DisplayName = ''
      Expression = 'SUM(valor)'
    end
  end
end
