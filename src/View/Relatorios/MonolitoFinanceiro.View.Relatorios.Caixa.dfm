inherited relCaixa: TrelCaixa
  Caption = 'relCaixa'
  ExplicitWidth = 785
  ExplicitHeight = 616
  TextHeight = 15
  inherited RLReport1: TRLReport
    inherited RLBand2: TRLBand
      inherited RLLabel2: TRLLabel
        Left = 275
        Width = 168
        Caption = 'Relat'#243'rio do Caixa'
        ExplicitLeft = 275
        ExplicitWidth = 168
      end
    end
    inherited RLBand3: TRLBand
      object RLLabel3: TRLLabel
        Left = 0
        Top = 0
        Width = 114
        Height = 23
        Align = faLeftTop
        Caption = 'Data'
      end
      object RLLabel4: TRLLabel
        Left = 128
        Top = 0
        Width = 129
        Height = 23
        Align = faTopOnly
        Caption = 'Documento'
      end
      object RLLabel5: TRLLabel
        Left = 275
        Top = 0
        Width = 218
        Height = 23
        Align = faTopOnly
        Caption = 'Descri'#231#227'o'
      end
      object RLLabel6: TRLLabel
        Left = 616
        Top = 0
        Width = 102
        Height = 23
        Align = faRightTop
        Alignment = taRightJustify
        Caption = 'Valor'
      end
      object RLLabel7: TRLLabel
        Left = 553
        Top = 0
        Width = 44
        Height = 23
        Align = faTopOnly
        Caption = 'Tipo'
      end
    end
    inherited RLBand4: TRLBand
      object RLDBText4: TRLDBText
        Left = 128
        Top = 0
        Width = 129
        Height = 23
        Align = faTopOnly
        DataField = 'numero_documento'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 275
        Top = 0
        Width = 272
        Height = 23
        Align = faTopOnly
        AutoSize = False
        DataField = 'descricao'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 616
        Top = 0
        Width = 102
        Height = 23
        Align = faRightTop
        DataField = 'valor'
        DataSource = DataSource1
        DisplayMask = 'R$ ,0.00;R$ -,0.00;'
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 0
        Top = 0
        Width = 114
        Height = 23
        Align = faLeftTop
        DataField = 'data_cadastro'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 553
        Top = 0
        Width = 57
        Height = 23
        Align = faTopOnly
        AutoSize = False
        DataField = 'tipo'
        DataSource = DataSource1
        Text = ''
      end
    end
  end
end
