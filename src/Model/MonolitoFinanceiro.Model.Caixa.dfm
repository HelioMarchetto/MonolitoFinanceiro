object dmCaixa: TdmCaixa
  Height = 322
  Width = 406
  object sqlCaixa: TFDQuery
    Connection = dmConexao.SQLConexao
    Left = 32
    Top = 24
  end
  object dspCaixa: TDataSetProvider
    DataSet = sqlCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 24
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 176
    Top = 24
    object cdsCaixaID: TStringField
      FieldName = 'ID'
      Size = 36
    end
    object cdsCaixaNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
    end
    object cdsCaixaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Size = 0
    end
    object cdsCaixaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsCaixaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
  end
  object sqlCaixaExtrato: TFDQuery
    Connection = dmConexao.SQLConexao
    Left = 32
    Top = 104
  end
end
