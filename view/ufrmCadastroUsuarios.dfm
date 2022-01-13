inherited frmcadastrousuarios: Tfrmcadastrousuarios
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited SpeedButton2: TSpeedButton
      Left = 79
      ExplicitLeft = 79
    end
    inherited SpeedButton4: TSpeedButton
      Left = 235
      ExplicitLeft = 235
    end
    inherited SpeedButton5: TSpeedButton
      Left = 309
      ExplicitLeft = 309
    end
    inherited SpeedButton6: TSpeedButton
      Left = 391
      ExplicitLeft = 391
    end
  end
  inherited PageControl1: TPageControl
    inherited tbsCadastro: TTabSheet
      inherited Label3: TLabel
        Left = 22
        Top = 21
        Caption = 'Nome:'
        ExplicitLeft = 22
        ExplicitTop = 21
      end
      object Label2: TLabel
        Left = 24
        Top = 48
        Width = 29
        Height = 13
        Caption = 'Login:'
      end
      object Label5: TLabel
        Left = 19
        Top = 75
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object edtnome: TEdit
        Left = 59
        Top = 21
        Width = 322
        Height = 21
        MaxLength = 50
        TabOrder = 0
      end
      object edtlogin: TEdit
        Left = 59
        Top = 48
        Width = 206
        Height = 21
        MaxLength = 20
        TabOrder = 1
      end
      object edtsenha: TEdit
        Left = 59
        Top = 75
        Width = 206
        Height = 21
        MaxLength = 20
        PasswordChar = '*'
        TabOrder = 2
      end
    end
    inherited tbspesquisa: TTabSheet
      inherited DbgDados: TDBGrid
        Top = 160
        Height = 204
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'login'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'senha'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'status'
            Visible = False
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
    end
  end
  inherited dsTabela: TDataSource
    DataSet = dmDados.cdsusuarios
    Left = 528
    Top = 24
  end
  inherited ImageListCadastro: TImageList
    Left = 576
    Top = 24
  end
  inherited actacoes: TActionList
    Left = 576
    Top = 80
  end
end
