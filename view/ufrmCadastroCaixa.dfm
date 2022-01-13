inherited frmcadastrocaixa: Tfrmcadastrocaixa
  Caption = 'Lan'#231'amentos Caixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbsCadastro: TTabSheet
      inherited Label3: TLabel
        Left = 3
        Width = 3
        Caption = ''
        ExplicitLeft = 3
        ExplicitWidth = 3
      end
      object Label2: TLabel
        Left = 3
        Top = 21
        Width = 3
        Height = 13
      end
      object Label5: TLabel
        Left = 0
        Top = 18
        Width = 58
        Height = 13
        Caption = 'Numero Doc'
      end
      object Label6: TLabel
        Left = 0
        Top = 43
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label7: TLabel
        Left = 0
        Top = 75
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object edtnumerodoc: TEdit
        Left = 64
        Top = 18
        Width = 169
        Height = 21
        TabOrder = 0
      end
      object edtdescricao: TEdit
        Left = 64
        Top = 45
        Width = 401
        Height = 21
        TabOrder = 1
      end
      object RadioGroup: TRadioGroup
        Left = 0
        Top = 112
        Width = 185
        Height = 54
        Caption = 'Tipo'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Cr'#233'dito'
          'D'#233'bito')
        TabOrder = 2
      end
      object edtvalor: TtpEdit
        Left = 64
        Top = 72
        Width = 121
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        TabOrder = 3
        Text = '0,00'
        Caracter = tcReal
      end
    end
    inherited tbspesquisa: TTabSheet
      inherited DbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero_doc'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end>
      end
      inherited btnfiltrar: TButton
        OnClick = btnfiltrarClick
      end
      inherited cbxfiltros: TComboBoxEx
        ItemsEx = <
          item
            Caption = 'Documento'
          end
          item
            Caption = 'Descri'#231#227'o'
          end>
      end
    end
  end
  inherited dsTabela: TDataSource
    Top = 72
  end
  inherited ImageListCadastro: TImageList
    Left = 592
    Top = 176
  end
  inherited actacoes: TActionList
    Top = 120
  end
end
