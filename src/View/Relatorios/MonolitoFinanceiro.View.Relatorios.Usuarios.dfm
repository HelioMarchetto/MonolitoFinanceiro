inherited relUsuarios: TrelUsuarios
  Caption = 'relUsuarios'
  TextHeight = 15
  inherited RLReport1: TRLReport
    DataSource = DataSource1
    inherited RLBand2: TRLBand
      inherited RLLabel2: TRLLabel
        Left = 265
        Width = 188
        Caption = 'Rela'#231#227'o de Usu'#225'rios'
        ExplicitLeft = 265
        ExplicitWidth = 188
      end
    end
    inherited RLBand3: TRLBand
      object RLLabel3: TRLLabel
        Left = 0
        Top = 0
        Width = 57
        Height = 23
        Align = faLeftTop
        Caption = 'Nome'
      end
      object RLLabel4: TRLLabel
        Left = 289
        Top = 0
        Width = 53
        Height = 23
        Align = faTopOnly
        Caption = 'Login'
      end
      object RLLabel5: TRLLabel
        Left = 656
        Top = 0
        Width = 62
        Height = 23
        Align = faRightTop
        Caption = 'Status'
      end
    end
    inherited RLBand4: TRLBand
      object RLDBText1: TRLDBText
        Left = 0
        Top = 0
        Width = 57
        Height = 23
        Align = faLeftTop
        DataField = 'nome'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 289
        Top = 0
        Width = 53
        Height = 23
        Align = faTopOnly
        DataField = 'login'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 656
        Top = 0
        Width = 62
        Height = 23
        Align = faRightTop
        DataField = 'status'
        DataSource = DataSource1
        Text = ''
      end
    end
  end
end
