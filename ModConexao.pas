unit ModConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DBXMySQL, Data.FMTBcd,
  Datasnap.Provider, Datasnap.DBClient;

type
  TdmDados = class(TDataModule)
    SQLConnection: TSQLConnection;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDConnection1: TFDConnection;
    qrytabelas: TFDQuery;
    cdscaixa: TClientDataSet;
    sdscaixa: TSQLDataSet;
    dspcaixa: TDataSetProvider;
    cdscontas_pagar: TClientDataSet;
    sdscontas_pagar: TSQLDataSet;
    dspcontas_pagar: TDataSetProvider;
    cdscontas_receber: TClientDataSet;
    sdscontas_receber: TSQLDataSet;
    dspcontas_receber: TDataSetProvider;
    cdsusuarios: TClientDataSet;
    sdsusuarios: TSQLDataSet;
    dspusuarios: TDataSetProvider;
    cdscaixaid: TIntegerField;
    cdscaixanumero_doc: TStringField;
    cdscaixadescricao: TStringField;
    cdscaixavalor: TFMTBCDField;
    cdscaixatipo: TStringField;
    cdscaixadt_cadastro: TDateField;
    cdscontas_pagarid: TIntegerField;
    cdscontas_pagarnumero_doc: TStringField;
    cdscontas_pagardescricao: TStringField;
    cdscontas_pagarparcela: TIntegerField;
    cdscontas_pagarvlr_parcela: TFMTBCDField;
    cdscontas_pagarvlr_compra: TFMTBCDField;
    cdscontas_pagarvlr_abatido: TFMTBCDField;
    cdscontas_pagardt_compra: TDateField;
    cdscontas_pagardt_cadastro: TDateField;
    cdscontas_pagardt_vencimento: TDateField;
    cdscontas_pagardt_pagamento: TDateField;
    cdscontas_pagarstatus: TStringField;
    cdscontas_receberid: TIntegerField;
    cdscontas_recebernumero_doc: TStringField;
    cdscontas_receberdescricao: TStringField;
    cdscontas_receberparcela: TIntegerField;
    cdscontas_recebervlr_parcela: TFMTBCDField;
    cdscontas_recebervlr_compra: TFMTBCDField;
    cdscontas_recebervlr_abatido: TFMTBCDField;
    cdscontas_receberdt_compra: TDateField;
    cdscontas_receberdt_cadastro: TDateField;
    cdscontas_receberdt_vencimento: TDateField;
    cdscontas_receberdt_pagamento: TDateField;
    cdscontas_receberstatus: TStringField;
    cdsusuariosid: TIntegerField;
    cdsusuariosnome: TStringField;
    cdsusuarioslogin: TStringField;
    cdsusuariossenha: TStringField;
    cdsusuariosstatus: TStringField;
    cdsusuariosdt_cadastro: TDateField;
    sdscaixaid: TIntegerField;
    sdscaixanumero_doc: TStringField;
    sdscaixadescricao: TStringField;
    sdscaixavalor: TFMTBCDField;
    sdscaixatipo: TStringField;
    sdscaixadt_cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
