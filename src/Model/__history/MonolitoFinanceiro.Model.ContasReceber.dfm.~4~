object dmContasReceber: TdmContasReceber
  OldCreateOrder = False
  Height = 234
  Width = 332
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
    CommandText = 'SELECT * FROM CONTAS_RECEBER'
    Params = <>
    ProviderName = 'dspContasReceber'
    Left = 240
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
      Precision = 18
      Size = 2
    end
    object cdsContasRecebervalor_venda: TFMTBCDField
      FieldName = 'valor_venda'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasRecebervalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Required = True
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
  end
end
