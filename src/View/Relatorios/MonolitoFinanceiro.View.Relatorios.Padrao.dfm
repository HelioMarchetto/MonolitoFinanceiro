object relPadrao: TrelPadrao
  Left = 0
  Top = 0
  Caption = 'relPadrao'
  ClientHeight = 579
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 37
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 190
        Height = 24
        Align = faLeftTop
        Caption = 'Monolito Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 75
      Width = 718
      Height = 48
      BandType = btTitle
      object RLLabel2: TRLLabel
        Left = 289
        Top = 0
        Width = 140
        Height = 23
        Align = faCenterTop
        Caption = 'T'#237'tulo Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 123
      Width = 718
      Height = 24
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 147
      Width = 718
      Height = 27
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 174
      Width = 718
      Height = 40
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLSystemInfo1: TRLSystemInfo
        Left = 518
        Top = 1
        Width = 200
        Height = 23
        Align = faRightTop
        Info = itLastPageNumber
        Text = 'de '
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 318
        Top = 1
        Width = 200
        Height = 23
        Align = faRightTop
        Alignment = taRightJustify
        Info = itPageNumber
        Text = 'P'#225'gina '
      end
      object lblNome: TRLLabel
        Left = 0
        Top = 1
        Width = 76
        Height = 23
        Align = faLeftTop
      end
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 681
    Top = 266
  end
end
