inherited frmCaixa: TfrmCaixa
  Caption = 'Caixa'
  ClientHeight = 506
  ClientWidth = 719
  ExplicitWidth = 725
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TCardPanel
    Width = 719
    Height = 506
    inherited cardCadastro: TCard
      Width = 717
      Height = 504
      ExplicitWidth = 738
      ExplicitHeight = 502
      object Label2: TLabel [0]
        Left = 16
        Top = 59
        Width = 69
        Height = 13
        Caption = 'N'#186' Documento'
      end
      object Label3: TLabel [1]
        Left = 16
        Top = 99
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel [2]
        Left = 16
        Top = 139
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      inherited Panel1: TPanel
        Top = 432
        Width = 717
        ExplicitTop = 430
        ExplicitWidth = 738
        inherited btnCancelar: TButton
          Left = 620
          ExplicitLeft = 641
        end
        inherited btnSalvar: TButton
          Left = 524
          ExplicitLeft = 545
        end
      end
      object edtNumeroDocumento: TEdit
        Left = 99
        Top = 56
        Width = 345
        Height = 21
        TabOrder = 1
      end
      object edtDescricao: TEdit
        Left = 99
        Top = 96
        Width = 345
        Height = 21
        TabOrder = 2
      end
      object edtValor: TEdit
        Left = 99
        Top = 136
        Width = 345
        Height = 21
        TabOrder = 3
      end
      object RadioGroup1: TRadioGroup
        Left = 16
        Top = 184
        Width = 428
        Height = 49
        Caption = 'Tipo'
        Columns = 2
        Items.Strings = (
          'Receita'
          'Despesa')
        TabOrder = 4
      end
    end
    inherited cardPesquisa: TCard
      Width = 717
      Height = 504
      inherited pnlPesquisa: TPanel
        Width = 717
        object Label5: TLabel [1]
          Left = 397
          Top = 12
          Width = 96
          Height = 13
          Caption = 'Tipo de Lan'#231'amento'
        end
        inherited edtPesquisar: TEdit
          Width = 321
          ExplicitWidth = 321
        end
        inherited Button1: TButton
          Left = 620
        end
        object cbTipo: TComboBox
          Left = 397
          Top = 31
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'TODOS'
          Items.Strings = (
            'TODOS'
            'RECEITA'
            'DESPESAS')
        end
      end
      inherited pnlGrid: TPanel
        Width = 717
        Height = 367
        inherited DBGrid1: TDBGrid
          Width = 715
          Height = 365
          DataSource = DataSource1
          ReadOnly = True
          Columns = <
            item
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Title.Caption = 'Data'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_DOCUMENTO'
              Title.Caption = 'N'#186' Documento'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 357
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Width = 36
              Visible = True
            end
            item
              Alignment = taLeftJustify
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor'
              Width = 63
              Visible = True
            end>
        end
      end
      inherited pnlPesquisaBotoes: TPanel
        Top = 432
        Width = 717
        inherited btnFechar: TButton
          Left = 620
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 617
    Top = 138
  end
  inherited DataSource1: TDataSource
    DataSet = dmCaixa.cdsCaixa
    Left = 617
    Top = 210
  end
end
