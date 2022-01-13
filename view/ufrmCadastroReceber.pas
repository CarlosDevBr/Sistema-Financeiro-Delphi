unit ufrmCadastroReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, tpEdit,
  Datasnap.DBClient;

type
  Tfrmcadastroreceber = class(Tfrmcadastrobasico)
    edtdocumento: TEdit;
    edtdescricao: TEdit;
    edtqtdeparcelas: TEdit;
    edtvariacao: TEdit;
    edtvlrcompra: TtpEdit;
    edtdtcompra: TtpEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cdsparcelas: TClientDataSet;
    cdsparcelasParcela: TIntegerField;
    cdsparcelasValor: TCurrencyField;
    cdsparcelasVencimento: TDateField;
    dsParcelas: TDataSource;
    procedure DbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure acsalvarExecute(Sender: TObject);
    procedure acpesquisarExecute(Sender: TObject);
    procedure acexcluirExecute(Sender: TObject);
    procedure aceditarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadastroreceber: Tfrmcadastroreceber;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes, ufrmCadastroPagar, System.SysUtils;

procedure Tfrmcadastroreceber.aceditarExecute(Sender: TObject);
begin

Application.MessageBox('Não é possivel editar o Campo!', 'Atenção', MB_OK+MB_ICONWARNING);
end;

procedure Tfrmcadastroreceber.acexcluirExecute(Sender: TObject);
begin
if Application.MessageBox('Deseja Relamente Cancelar o Documento?', 'Pergunta',MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    try
      TClientDataSet(dsTabela.DataSet).Edit;
      dmDados.cdscontas_receberStatus.AsString := 'C';
      TclientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      Application.MessageBox('Documento Cancelado com sucesso!', 'Informação', 0+64);
      TClientDataSet(dsTabela.DataSet).Open;

      except on E : Exception do

      raise Exception.Create('Erro ao Excluir Registro: ');


    end;
  end;
end;

procedure Tfrmcadastroreceber.acpesquisarExecute(Sender: TObject);
begin
  inherited;
dmDados.cdscontas_receber.Close;
dmDados.cdscontas_receber.CommandText := 'SELECT * FROM CONTAS_RECEBER';
dmDados.cdscontas_receber.Open;
end;

procedure Tfrmcadastroreceber.acsalvarExecute(Sender: TObject);
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
   dmDados.cdscontas_receber.Insert;
   dmDados.cdscontas_receberid.AsInteger := GetId('ID', 'CONTAS_RECEBER');
   dmDados.cdscontas_recebernumero_doc.AsString := trim(edtdocumento.Text);
   dmDados.cdscontas_receberdescricao.AsString := trim(edtdescricao.Text);
   dmDados.cdscontas_receberParcela.AsInteger := cdsParcelasParcela.AsInteger;
   dmDados.cdscontas_recebervlr_parcela.AsCurrency := cdsParcelasValor.AsInteger;
   dmDados.cdscontas_recebervlr_compra.AsCurrency := StringToFloat(edtVlrcompra.Text);
   dmDados.cdscontas_receberdt_compra.AsDateTime := StrToDate(edtdtcompra.Text);
   dmDados.cdscontas_receberdt_vencimento.AsDateTime := cdsParcelasVencimento.AsDateTime;
   dmDados.cdscontas_receberdt_cadastro.AsDateTime := now;
   dmDados.cdscontas_receberstatus.AsString := 'A';
   dmDados.cdscontas_recebervlr_abatido.AsCurrency := 0;
   dmDados.cdscontas_receber.Post;
   dmDados.cdscontas_receber.ApplyUpdates(0);
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


end;

procedure Tfrmcadastroreceber.btnfiltrarClick(Sender: TObject);
begin
  inherited;
if edtpesquisar.Text = '' then

begin
  Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
  edtpesquisar.SetFocus;
  Abort;
end;

  dmDados.cdscontas_receber.Close;
  case cbxfiltros.ItemIndex of
  0 : dmDados.cdscontas_receber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE NUMERO_DOC LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  1 : dmDados.cdscontas_receber.CommandText := 'SELECT * FROM CONTAS_RECEBER WHERE DESCRIÇÃO LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  end;
  dmDados.cdscontas_receber.Open;
end;

procedure Tfrmcadastroreceber.Button1Click(Sender: TObject);
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

procedure Tfrmcadastroreceber.Button2Click(Sender: TObject);
begin

  cdsParcelas.EmptyDataSet;
end;

procedure Tfrmcadastroreceber.DbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

EditarDBGrid(dsParcelas,DBGrid1,State,Rect,Column);

end;

end.
