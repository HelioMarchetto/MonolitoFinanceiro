object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Monolito Financeiro'
  ClientHeight = 418
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 399
    Width = 646
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 300
      end>
    ExplicitTop = 398
    ExplicitWidth = 642
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 24
    object mnuCadastro: TMenuItem
      Caption = 'Cadastros'
      object mnuUsuarios: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = mnuUsuariosClick
      end
    end
    object menuFinanceiro: TMenuItem
      Caption = 'Financeiro'
      object menuCaixa: TMenuItem
        Caption = 'Caixa'
        OnClick = menuCaixaClick
      end
      object mnuContasPagar: TMenuItem
        Caption = 'Contas a Pagar'
        OnClick = mnuContasPagarClick
      end
      object mnuContasReceber: TMenuItem
        Caption = 'Contas a Receber'
        OnClick = mnuContasReceberClick
      end
      object mnuContasReceberConsultar: TMenuItem
        Caption = 'Consultar Contas a Receber'
        OnClick = mnuContasReceberConsultarClick
      end
    end
    object mnuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object mnuResumoCaixa: TMenuItem
        Caption = 'Resumo do Caixa'
        OnClick = mnuResumoCaixaClick
      end
    end
    object mnuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 560
    Top = 352
  end
end
