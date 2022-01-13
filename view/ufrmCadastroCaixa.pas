unit ufrmCadastroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  FireDAC.Phys.MySQLDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, tpEdit;

type
  Tfrmcadastrocaixa = class(Tfrmcadastrobasico)
    Label2: TLabel;
    Label5: TLabel;
    edtnumerodoc: TEdit;
    edtdescricao: TEdit;
    RadioGroup: TRadioGroup;
    Label6: TLabel;
    edtvalor: TtpEdit;
    Label7: TLabel;
    procedure acsalvarExecute(Sender: TObject);
    procedure acpesquisarExecute(Sender: TObject);
    procedure aceditarExecute(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadastrocaixa: Tfrmcadastrocaixa;

implementation

{$R *.dfm}

uses Uprincipal, ModConexao, UFuncoes, System.Math;

procedure Tfrmcadastrocaixa.aceditarExecute(Sender: TObject);
begin
  inherited;
  edtNumeroDoc.Text := dmDados.cdscaixanumero_doc.AsString;
    edtDescricao.Text := dmDados.cdscaixadescricao.AsString;
      edtValor.Text := FloattoStr(dmDados.cdscaixavalor.AsCurrency);
      Radiogroup.ItemIndex := ifthen (dmDados.cdscaixatipo.AsString = 'C',0,1);
end;

procedure Tfrmcadastrocaixa.acpesquisarExecute(Sender: TObject);
begin
  inherited;
dmDados.cdscaixa.Close;
dmDados.cdscaixa.CommandText := 'SELECT * FROM CAIXA';
dmDados.cdscaixa.Open;
end;

procedure Tfrmcadastrocaixa.acsalvarExecute(Sender: TObject);
begin
  if Trim(edtnumerodoc.text) = '' then
  begin
    Application.MessageBox('Preencha o campo Documento!', 'Atenção', MB_OK+MB_ICONWARNING);
    edtnumerodoc.SetFocus;
    Abort;
  end;

  if Trim(edtdescricao.text) = '' then
  begin
    Application.MessageBox('Preencha o campo Descrição!', 'Atenção', MB_OK+MB_ICONWARNING);
    edtdescricao.SetFocus;
    Abort;
  end;

  if StringToFloat(edtValor.Text) <= 0 then
  begin
    Application.MessageBox('Insita um Valor maior que 0!', 'Atenção', MB_OK+MB_ICONWARNING);
    edtvalor.SetFocus;
    Abort;
  end;

  if dsTabela.State in [dsInsert] then


  dmDados.cdscaixaid.AsInteger := GetId('ID', 'CAIXA');
  dmDados.cdscaixanumero_doc.AsString := trim(edtnumerodoc.Text);
  dmDados.cdscaixadescricao.AsString := trim(edtdescricao.Text);
  dmDados.cdscaixavalor.AsCurrency := StringToFloat(edtvalor.Text);
  dmDados.cdscaixadt_cadastro.AsDateTime := now;

    case RadioGroup.ItemIndex of
    0 : dmDados.cdscaixatipo.AsString := 'C';
    1 : dmDados.cdscaixatipo.AsString := 'D';
    end;
  inherited;

end;

procedure Tfrmcadastrocaixa.btnfiltrarClick(Sender: TObject);
begin
if edtpesquisar.Text = '' then

begin
  Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
  edtpesquisar.SetFocus;
  Abort;
end;
  inherited;
  dmDados.cdscaixa.Close;
  case cbxfiltros.ItemIndex of
  0 : dmDados.cdscaixa.CommandText := 'SELECT * FROM CAIXA WHERE NOME LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  1 : dmDados.cdscaixa.CommandText := 'SELECT * FROM CAIXA WHERE LOGIN LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  end;
  dmDados.cdsusuarios.Open;
end;

end.
