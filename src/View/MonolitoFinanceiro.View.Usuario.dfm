inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro Usu'#225'rios'
  ClientHeight = 469
  ExplicitHeight = 507
  TextHeight = 13
  inherited PnlPrincipal: TCardPanel
    Height = 469
    ExplicitHeight = 468
    inherited cardCadastro: TCard
      Height = 467
      ExplicitHeight = 467
      object Label2: TLabel [0]
        Left = 16
        Top = 64
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel [1]
        Left = 16
        Top = 107
        Width = 25
        Height = 13
        Caption = 'Login'
      end
      object Label5: TLabel [2]
        Left = 16
        Top = 155
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      inherited Panel1: TPanel
        Top = 395
        ExplicitTop = 395
      end
      object edtNome: TEdit
        Left = 64
        Top = 56
        Width = 345
        Height = 21
        TabOrder = 1
      end
      object edtLogin: TEdit
        Left = 64
        Top = 104
        Width = 345
        Height = 21
        TabOrder = 2
      end
      object ToggleStatus: TToggleSwitch
        Left = 64
        Top = 148
        Width = 106
        Height = 20
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 3
      end
    end
    inherited cardPesquisa: TCard
      Height = 467
      ExplicitHeight = 466
      inherited pnlGrid: TPanel
        Height = 330
        ExplicitHeight = 329
        inherited DBGrid1: TDBGrid
          Height = 328
          DataSource = DataSource1
          DrawingStyle = gdsGradient
          PopupMenu = PopupMenu1
          Columns = <
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 401
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Login'
              Width = 268
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Status'
              Width = 81
              Visible = True
            end>
        end
      end
      inherited pnlPesquisaBotoes: TPanel
        Top = 395
        ExplicitTop = 394
        inherited btnImprimir: TButton
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
  end
  object PopupMenu1: TPopupMenu
    Left = 689
    Top = 274
    object mnuLimparSenha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = mnuLimparSenhaClick
    end
  end
end
