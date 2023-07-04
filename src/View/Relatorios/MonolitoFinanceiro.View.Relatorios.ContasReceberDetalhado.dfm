inherited relContasReceberDetalhado: TrelContasReceberDetalhado
  Caption = 'relContasReceberDetalhado'
  ClientWidth = 781
  TextHeight = 15
  inherited RLReport1: TRLReport
    DataSource = DataSource1
    inherited RLBand2: TRLBand
      inherited RLLabel2: TRLLabel
        Left = 181
        Width = 356
        Caption = 'Rela'#231#227'o de Contas  Receber Detalhado'
        ExplicitLeft = 181
        ExplicitWidth = 356
      end
    end
    inherited RLBand5: TRLBand
      Top = 297
      ExplicitTop = 297
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 123
      Width = 718
      Height = 174
      DataFields = 'ID'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 32
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBText1: TRLDBText
          Left = 0
          Top = 1
          Width = 268
          Height = 23
          Align = faLeftTop
          DataField = 'data_vencimento'
          DataSource = DataSource1
          Text = 'Vencimento: '
        end
        object RLDBText2: TRLDBText
          Left = 282
          Top = 1
          Width = 225
          Height = 23
          Align = faTopOnly
          DataField = 'numero_documento'
          DataSource = DataSource1
          Text = 'Doc: '
        end
        object RLDBText3: TRLDBText
          Left = 445
          Top = 1
          Width = 127
          Height = 23
          Align = faTopOnly
          DataField = 'status'
          DataSource = DataSource1
          Text = 'Status: '
        end
        object RLDBText4: TRLDBText
          Left = 536
          Top = 1
          Width = 182
          Height = 23
          Align = faRightTop
          DataField = 'valor_parcela'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00;R$ -,0.00;'
          Text = 'Valor: '
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 32
        Width = 718
        Height = 32
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel3: TRLLabel
          Left = 16
          Top = 0
          Width = 121
          Height = 23
          Align = faTopOnly
          Caption = 'Recebimento'
        end
        object RLLabel4: TRLLabel
          Left = 210
          Top = 0
          Width = 247
          Height = 23
          Align = faTopOnly
          Caption = 'Detalhes'
        end
        object RLLabel5: TRLLabel
          Left = 592
          Top = 0
          Width = 126
          Height = 23
          Align = faRightTop
          Alignment = taRightJustify
          Caption = 'Valor'
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 64
        Width = 718
        Height = 26
        GreenBarPrint = True
        object RLDBText5: TRLDBText
          Left = 16
          Top = 0
          Width = 45
          Height = 23
          Align = faTopOnly
          DataField = 'data'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 210
          Top = 0
          Width = 80
          Height = 23
          Align = faTopOnly
          DataField = 'detalhes'
          DataSource = DataSource1
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 670
          Top = 0
          Width = 48
          Height = 23
          Align = faRightTop
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00;R$ -,0.00;'
          Text = ''
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 90
        Width = 718
        Height = 32
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 353
          Top = 0
          Width = 365
          Height = 25
          Align = faRightTop
          Alignment = taRightJustify
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'valor_abatido'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00;R$ -,0.00;'
          Info = riLastText
          Text = 'Total Recebido: '
        end
      end
    end
  end
end
