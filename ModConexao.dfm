object dmDados: TdmDados
  OldCreateOrder = False
  Height = 440
  Width = 561
  object SQLConnection: TSQLConnection
    ConnectionName = 'financeiro'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver270.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver270.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'Password=YES'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'HostName=localhost'
      'Database=financeiro'
      'User_Name=root')
    Connected = True
    Left = 208
    Top = 40
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'E:\DOCUMENTOS\MySQL\dll\libmysql.dll'
    Left = 48
    Top = 96
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 176
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=financeiro'
      'User_Name=root'
      'Password=YES'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 48
    Top = 248
  end
  object qrytabelas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select*from caixa')
    Left = 48
    Top = 312
  end
  object cdscaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspcaixa'
    Left = 368
    Top = 112
    object cdscaixaid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdscaixanumero_doc: TStringField
      DisplayLabel = 'Numero Doc'
      FieldName = 'numero_doc'
      Required = True
    end
    object cdscaixadescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 200
    end
    object cdscaixavalor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
      Precision = 19
      Size = 0
    end
    object cdscaixatipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdscaixadt_cadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'dt_cadastro'
      Required = True
    end
  end
  object sdscaixa: TSQLDataSet
    CommandText = 'select * from caixa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 208
    Top = 112
    object sdscaixaid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
      Required = True
    end
    object sdscaixanumero_doc: TStringField
      DisplayLabel = 'Numero Doc'
      FieldName = 'numero_doc'
      Required = True
    end
    object sdscaixadescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 200
    end
    object sdscaixavalor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Required = True
      Precision = 19
      Size = 0
    end
    object sdscaixatipo: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sdscaixadt_cadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'dt_cadastro'
      Required = True
    end
  end
  object dspcaixa: TDataSetProvider
    DataSet = sdscaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 112
  end
  object cdscontas_pagar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspcontas_pagar'
    Left = 368
    Top = 176
    object cdscontas_pagarid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdscontas_pagarnumero_doc: TStringField
      DisplayLabel = 'Numero Doc'
      FieldName = 'numero_doc'
      Required = True
    end
    object cdscontas_pagardescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 200
    end
    object cdscontas_pagarparcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
      Required = True
    end
    object cdscontas_pagarvlr_parcela: TFMTBCDField
      DisplayLabel = 'Valor Parcela'
      FieldName = 'vlr_parcela'
      Required = True
      Precision = 19
      Size = 0
    end
    object cdscontas_pagarvlr_compra: TFMTBCDField
      DisplayLabel = 'Valor Compra'
      FieldName = 'vlr_compra'
      Required = True
      Precision = 19
      Size = 0
    end
    object cdscontas_pagarvlr_abatido: TFMTBCDField
      DisplayLabel = 'Valor Abatido'
      FieldName = 'vlr_abatido'
      Required = True
      Precision = 19
      Size = 0
    end
    object cdscontas_pagardt_compra: TDateField
      DisplayLabel = 'Data Compra'
      FieldName = 'dt_compra'
      Required = True
    end
    object cdscontas_pagardt_cadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'dt_cadastro'
      Required = True
    end
    object cdscontas_pagardt_vencimento: TDateField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'dt_vencimento'
      Required = True
    end
    object cdscontas_pagardt_pagamento: TDateField
      DisplayLabel = 'Data Pagamento'
      FieldName = 'dt_pagamento'
    end
    object cdscontas_pagarstatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 10
    end
  end
  object sdscontas_pagar: TSQLDataSet
    CommandText = 'Select * from contas_pagar'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 208
    Top = 176
  end
  object dspcontas_pagar: TDataSetProvider
    DataSet = sdscontas_pagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 176
  end
  object cdscontas_receber: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspcontas_receber'
    Left = 368
    Top = 248
    object cdscontas_receberid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdscontas_recebernumero_doc: TStringField
      DisplayLabel = 'Numero Doc'
      FieldName = 'numero_doc'
      Required = True
    end
    object cdscontas_receberdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 200
    end
    object cdscontas_receberparcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'parcela'
      Required = True
    end
    object cdscontas_recebervlr_parcela: TFMTBCDField
      DisplayLabel = 'Valor Parcela'
      FieldName = 'vlr_parcela'
      Required = True
      currency = True
      Precision = 19
      Size = 0
    end
    object cdscontas_recebervlr_compra: TFMTBCDField
      DisplayLabel = 'Valor Compra'
      FieldName = 'vlr_compra'
      Required = True
      currency = True
      Precision = 19
      Size = 0
    end
    object cdscontas_recebervlr_abatido: TFMTBCDField
      DisplayLabel = 'Valor Abatido'
      FieldName = 'vlr_abatido'
      Required = True
      currency = True
      Precision = 19
      Size = 0
    end
    object cdscontas_receberdt_compra: TDateField
      DisplayLabel = 'Data Compra'
      FieldName = 'dt_compra'
      Required = True
    end
    object cdscontas_receberdt_cadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'dt_cadastro'
      Required = True
    end
    object cdscontas_receberdt_vencimento: TDateField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'dt_vencimento'
      Required = True
    end
    object cdscontas_receberdt_pagamento: TDateField
      DisplayLabel = 'Data Pagamento'
      FieldName = 'dt_pagamento'
    end
    object cdscontas_receberstatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 10
    end
  end
  object sdscontas_receber: TSQLDataSet
    CommandText = 'select * from contas_receber'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 208
    Top = 248
  end
  object dspcontas_receber: TDataSetProvider
    DataSet = sdscontas_receber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 248
  end
  object cdsusuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspusuarios'
    Left = 368
    Top = 328
    object cdsusuariosid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsusuariosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object cdsusuarioslogin: TStringField
      FieldName = 'login'
      Required = True
    end
    object cdsusuariossenha: TStringField
      FieldName = 'senha'
      Required = True
    end
    object cdsusuariosstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsusuariosdt_cadastro: TDateField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'dt_cadastro'
    end
  end
  object sdsusuarios: TSQLDataSet
    CommandText = 'select * from usuarios'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 208
    Top = 328
  end
  object dspusuarios: TDataSetProvider
    DataSet = sdsusuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 328
  end
end
