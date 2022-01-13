inherited frmcadastroreceber: Tfrmcadastroreceber
  Caption = 'Cadastro de Contas a Receber'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited SpeedButton3: TSpeedButton
      Left = 160
      ExplicitLeft = 160
    end
  end
  inherited PageControl1: TPageControl
    inherited tbsCadastro: TTabSheet
      TabVisible = True
      inherited Label3: TLabel
        Left = 25
        Top = 6
        Width = 54
        Caption = 'Documento'
        ExplicitLeft = 25
        ExplicitTop = 6
        ExplicitWidth = 54
      end
      object Label2: TLabel
        Left = 33
        Top = 30
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label5: TLabel
        Left = 17
        Top = 57
        Width = 62
        Height = 13
        Caption = 'Qtde Parcela'
      end
      object Label6: TLabel
        Left = 3
        Top = 84
        Width = 79
        Height = 13
        Caption = 'Valor da Compra'
      end
      object Label7: TLabel
        Left = 13
        Top = 111
        Width = 66
        Height = 13
        Caption = 'Dt da Compra'
      end
      object Label8: TLabel
        Left = 203
        Top = 57
        Width = 41
        Height = 13
        Caption = 'Varia'#231#227'o'
      end
      object edtdocumento: TEdit
        Left = 85
        Top = 3
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtdescricao: TEdit
        Left = 85
        Top = 30
        Width = 384
        Height = 21
        TabOrder = 1
      end
      object edtqtdeparcelas: TEdit
        Left = 85
        Top = 57
        Width = 95
        Height = 21
        TabOrder = 2
      end
      object edtvariacao: TEdit
        Left = 250
        Top = 57
        Width = 63
        Height = 21
        TabOrder = 3
      end
      object edtvlrcompra: TtpEdit
        Left = 85
        Top = 84
        Width = 95
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        TabOrder = 4
        Text = '0,00'
        Caracter = tcReal
      end
      object edtdtcompra: TtpEdit
        Left = 85
        Top = 114
        Width = 95
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 5
        Check = ckDate
        Caracter = tcNumeric
      end
      object Button1: TButton
        Left = 85
        Top = 141
        Width = 95
        Height = 25
        Caption = 'Gerar Parcela'
        TabOrder = 6
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 186
        Top = 141
        Width = 95
        Height = 25
        Caption = 'Limpar Parcelas'
        TabOrder = 7
        OnClick = Button2Click
      end
      object DBGrid1: TDBGrid
        Left = 85
        Top = 172
        Width = 244
        Height = 95
        DataSource = dsParcelas
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DbgDadosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Parcela'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vencimento'
            Width = 87
            Visible = True
          end>
      end
    end
    inherited tbspesquisa: TTabSheet
      inherited DbgDados: TDBGrid
        Top = 144
        Height = 220
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero_doc'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'parcela'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_parcela'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_compra'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_abatido'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_compra'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_vencimento'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_pagamento'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Width = 40
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
    DataSet = dmDados.cdscontas_receber
  end
  object cdsparcelas: TClientDataSet
    PersistDataPacket.Data = {
      5F0000009619E0BD0100000018000000030000000000030000005F0007506172
      63656C6104000100000000000556616C6F720800040000000100075355425459
      50450200490006004D6F6E6579000A56656E63696D656E746F04000600000000
      000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 256
    object cdsparcelasParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object cdsparcelasValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cdsparcelasVencimento: TDateField
      FieldName = 'Vencimento'
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsparcelas
    Left = 600
    Top = 312
  end
end
