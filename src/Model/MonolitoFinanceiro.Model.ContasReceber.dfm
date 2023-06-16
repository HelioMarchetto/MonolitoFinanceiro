object dmContasReceber: TdmContasReceber
  Height = 234
  Width = 537
  object sqlContasReceber: TFDQuery
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'SELECT * FROM CONTAS_RECEBER')
    Left = 32
    Top = 24
  end
  object dspContasReceber: TDataSetProvider
    DataSet = sqlContasReceber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 24
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    CommandText = 'SELECT * FROM CONTAS_RECEBER'
    Params = <>
    ProviderName = 'dspContasReceber'
    Left = 248
    Top = 24
    object cdsContasReceberid: TStringField
      FieldName = 'id'
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsContasRecebernumero_documento: TStringField
      FieldName = 'numero_documento'
      Required = True
    end
    object cdsContasReceberdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object cdsContasReceberparcela: TIntegerField
      FieldName = 'parcela'
      Required = True
    end
    object cdsContasRecebervalor_parcela: TFMTBCDField
      FieldName = 'valor_parcela'
      Required = True
      DisplayFormat = 'R$ ,0.00;R$ -,0.00;'
      Precision = 18
      Size = 2
    end
    object cdsContasRecebervalor_venda: TFMTBCDField
      FieldName = 'valor_venda'
      Required = True
      DisplayFormat = 'R$ ,0.00;R$ -,0.00;'
      Precision = 18
      Size = 2
    end
    object cdsContasRecebervalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Required = True
      DisplayFormat = 'R$ ,0.00;R$ -,0.00;'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberdata_venda: TDateField
      FieldName = 'data_venda'
      Required = True
    end
    object cdsContasReceberdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Required = True
    end
    object cdsContasReceberdata_vencimento: TDateField
      FieldName = 'data_vencimento'
      Required = True
    end
    object cdsContasReceberdata_recebimento: TDateField
      FieldName = 'data_recebimento'
    end
    object cdsContasReceberstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsContasReceberTotal: TAggregateField
      FieldName = 'Total'
      Active = True
      DisplayName = ''
      Expression = 'SUM(valor_parcela)'
    end
  end
  object sqlContasReceberDetalhes: TFDQuery
    AggregatesActive = True
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'SELECT * FROM CONTAS_RECEBER_DETALHES')
    Left = 64
    Top = 88
    object sqlContasReceberDetalhesid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlContasReceberDetalhesid_conta_receber: TStringField
      FieldName = 'id_conta_receber'
      Origin = 'id_conta_receber'
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlContasReceberDetalhesdetalhes: TStringField
      DisplayLabel = 'Detalhes'
      FieldName = 'detalhes'
      Origin = 'detalhes'
      Required = True
      Size = 200
    end
    object sqlContasReceberDetalhesvalor: TFMTBCDField
      DisplayLabel = 'Valor Abatido'
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      DisplayFormat = 'R$ ,0.00;R$ -,0.00;'
      Precision = 18
      Size = 2
    end
    object sqlContasReceberDetalhesdata: TDateField
      DisplayLabel = 'Data da Baixa'
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object sqlContasReceberDetalhesusuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 50
    end
    object sqlContasReceberDetalhesnome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'nome'
      Size = 50
    end
    object sqlContasReceberDetalhesTotal: TAggregateField
      FieldName = 'Total'
      Active = True
      DisplayName = ''
      Expression = 'SUM(valor)'
    end
  end
end
