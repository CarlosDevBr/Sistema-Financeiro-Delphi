unit ufrmCadastroPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Datasnap.DBClient, tpEdit;

type
  Tfrmcadastropagar = class(Tfrmcadastrobasico)
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtdocumento: TEdit;
    edtdescricao: TEdit;
    edtqtdeparcelas: TEdit;
    edtvlrcompra: TtpEdit;
    edtdtcompra: TtpEdit;
    Label7: TLabel;
    edtvariacao: TEdit;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    cdsparcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsparcelasParcela: TIntegerField;
    cdsparcelasValor: TCurrencyField;
    cdsparcelasVencimento: TDateField;
    Button2: TButton;
    Label9: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure acsalvarExecute(Sender: TObject);
    procedure aceditarExecute(Sender: TObject);
    procedure acpesquisarExecute(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure acexcluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadastropagar: Tfrmcadastropagar;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes, Uprincipal;

procedure Tfrmcadastropagar.aceditarExecute(Sender: TObject);
begin

Application.MessageBox('Não é possivel editar o Campo!', 'Atenção', MB_OK+MB_ICONWARNING);

end;

procedure Tfrmcadastropagar.acexcluirExecute(Sender: TObject);
begin
  //inherited;
    if Application.MessageBox('Deseja Relamente Cancelar o Documento?', 'Pergunta',MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    try
      TClientDataSet(dsTabela.DataSet).Edit;
      dmDados.cdscontas_pagarStatus.AsString := 'C';
      dmDados.cdscontas_pagar.Close;
      TclientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      Application.MessageBox('Documento Cancelado com sucesso!', 'Informação', 0+64);
      TClientDataSet(dsTabela.DataSet).Open;

      except on E : Exception do

      raise Exception.Create('Erro ao Excluir Registro: ');


    end;
  end;
end;

procedure Tfrmcadastropagar.acpesquisarExecute(Sender: TObject);
begin
  inherited;
dmDados.cdscontas_pagar.Close;
dmDados.cdscontas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR';
dmDados.cdscontas_pagar.Open;
end;

procedure Tfrmcadastropagar.acsalvarExecute(Sender: TObject);

var i : integer;

begin

  if Trim(edtdocumento.Text) =  '' then
   begin
     Application.MessageBox('Preencha o campo Documento!', 'Atenção', MB_OK+MB_ICONWARNING);
     edtdocumento.SetFocus;
     Abort;
   end;

   //código do botão salvar

   try



cdsParcelas.First;
 while not cdsParcelas.eof do
    if dsTabela.State in [dsBrowse, dsInsert] then
    begin
   dmDados.cdscontas_pagar.Insert;
   dmDados.cdscontas_pagarid.AsInteger := GetId('ID', 'CONTAS_PAGAR');
   dmDados.cdscontas_pagarnumero_doc.AsString := trim(edtdocumento.Text);
   dmDados.cdscontas_pagardescricao.AsString := trim(edtdescricao.Text);
   dmDados.cdscontas_pagarParcela.AsInteger := cdsParcelasParcela.AsInteger;
   dmDados.cdscontas_pagarvlr_parcela.AsCurrency := cdsParcelasValor.AsInteger;
   dmDados.cdscontas_pagarvlr_compra.AsCurrency := StringToFloat(edtVlrcompra.Text);
   dmDados.cdscontas_pagardt_compra.AsDateTime := StrToDate(edtdtcompra.Text);
   dmDados.cdscontas_pagardt_vencimento.AsDateTime := cdsParcelasVencimento.AsDateTime;
   dmDados.cdscontas_pagardt_cadastro.AsDateTime := now;
   dmDados.cdscontas_pagarstatus.AsString := 'A';
   dmDados.cdscontas_pagarvlr_abatido.AsCurrency := 0;
   dmDados.cdscontas_pagar.Post;
   dmDados.cdscontas_pagar.ApplyUpdates(0);
   cdsParcelas.Next;
   end;

       Application.MessageBox('Registro Inserido com Sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
       TClientDataSet(dsTabela.DataSet).Open;

       for i := 0 to ComponentCount -1 do
 begin
   if Components[i] is TCustomEdit then
   TCustomEdit(Components[i]).Clear;
 end;
  if PageControl1.ActivePage = tbsCadastro  then
  begin
     tbsCadastro.TabVisible := false;
     PageControl1.ActivePage := tbsPesquisa;
      end;
      edtpesquisar.setFocus;

       cdsParcelas.EmptyDataSet;




except on E : Exception do
raise Exception.Create('Erro ao Salvar Registro: '+E.Message);

end;

 // final do código do botão salvar


 // inherited;

end;

procedure Tfrmcadastropagar.btnfiltrarClick(Sender: TObject);
begin
inherited;
if edtpesquisar.Text = '' then

begin
  Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
  edtpesquisar.SetFocus;
  Abort;
end;

  dmDados.cdscontas_pagar.Close;
  case cbxfiltros.ItemIndex of
  0 : dmDados.cdscontas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE NUMERO_DOC LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  1 : dmDados.cdscontas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE DESCRICAO LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  end;
  dmDados.cdscontas_pagar.Open;

end;

procedure Tfrmcadastropagar.Button1Click(Sender: TObject);

var i : Integer;

begin

    if edtdocumento.Text = '' then
        begin
            Application.MessageBox('Preencha o campo Documento!', 'Atenção', MB_OK+MB_ICONWARNING);
            edtdocumento.SetFocus;
            Abort;
        end;

    if edtdescricao.Text = '' then
        begin
            Application.MessageBox('Preencha o campo Descriçao!', 'Atenção', MB_OK+MB_ICONWARNING);
            edtdescricao.SetFocus;
            Abort;
        end;

    if edtqtdeparcelas.Text = '' then
        begin
            Application.MessageBox('Preencha o campo de Qtde Parcelas!', 'Atenção', MB_OK+MB_ICONWARNING);
            edtqtdeparcelas.SetFocus;
            Abort;
        end;

    if StringToFloat(edtvlrcompra.Text) = 0 then
        begin
            Application.MessageBox('Preencha o Valor da Compra!', 'Atenção', MB_OK+MB_ICONWARNING);
            edtvlrcompra.SetFocus;
            Abort;
        end;

    if edtdtcompra.Text = '' then
        begin
            Application.MessageBox('Preencha o campo Dt compra!', 'Atenção', MB_OK+MB_ICONWARNING);
            edtdtcompra.SetFocus;
            Abort;
        end;

        cdsparcelas.EmptyDataSet;

   for I := 1 to StrToInt(edtqtdeparcelas.Text) do
   begin
     cdsParcelas.Insert;
     cdsParcelasParcela.AsInteger := i;
     cdsParcelasValor.AsCurrency := StringToFloat(edtvlrcompra.Text) / StrToInt(edtqtdeparcelas.Text);
     cdsParcelasVencimento.AsDateTime := StrToDate(edtdtcompra.Text) + (StrToInt(edtVariacao.Text) * i);
     cdsParcelas.Post;
   end;


end;

procedure Tfrmcadastropagar.Button2Click(Sender: TObject);
begin

  cdsParcelas.EmptyDataSet;

end;

procedure Tfrmcadastropagar.DbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

EditarDBGrid(dsParcelas,DBGrid1,State,Rect,Column);

end;

end.
