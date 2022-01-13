unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Datasnap.DBClient, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.UI,
  Vcl.Buttons;

type
  Tfrmcadastrobasico = class(TForm)
    dsTabela: TDataSource;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    tbsCadastro: TTabSheet;
    Image1: TImage;
    ImageListCadastro: TImageList;
    PageControl1: TPageControl;
    EdtPesquisar: TEdit;
    btnfiltrar: TButton;
    actacoes: TActionList;
    acinserir: TAction;
    aceditar: TAction;
    acexcluir: TAction;
    acsalvar: TAction;
    accancelar: TAction;
    acpesquisar: TAction;
    acimprimir: TAction;
    acfechar: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    DbgDados: TDBGrid;
    Label3: TLabel;
    tbspesquisa: TTabSheet;
    cbxfiltros: TComboBoxEx;
    Label1: TLabel;
    Label4: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actexcluirExecute(Sender: TObject);
    procedure actcancelarUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsPesquisarShow(Sender: TObject);
    procedure acinserirExecute(Sender: TObject);
    procedure aceditarExecute(Sender: TObject);
    procedure acexcluirExecute(Sender: TObject);
    procedure acsalvarExecute(Sender: TObject);
    procedure accancelarExecute(Sender: TObject);
    procedure acpesquisarExecute(Sender: TObject);
    procedure acimprimirExecute(Sender: TObject);
    procedure acfecharExecute(Sender: TObject);
    procedure acinserirUpdate(Sender: TObject);
    procedure aceditarUpdate(Sender: TObject);
    procedure acexcluirUpdate(Sender: TObject);
    procedure acsalvarUpdate(Sender: TObject);
    procedure accancelarUpdate(Sender: TObject);
    procedure acimprimirUpdate(Sender: TObject);
    procedure DbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    iModo: Integer;
    procedure LimparTudo;
  public
    { Public declarations }
  end;

var
  frmcadastrobasico: Tfrmcadastrobasico;

implementation

{$R *.dfm}

uses ModConexao, UFuncoes;

procedure Tfrmcadastrobasico.accancelarExecute(Sender: TObject);
begin
LimparTudo;
TclientDataSet(dsTabela.DataSet).Cancel;
end;

procedure Tfrmcadastrobasico.accancelarUpdate(Sender: TObject);
begin
   accancelar.Enabled := acsalvar.Enabled = true;
end;

procedure Tfrmcadastrobasico.aceditarExecute(Sender: TObject);
begin
iModo := 1;
if PageControl1.ActivePage = tbsPesquisa then
  tbsCadastro.TabVisible := true;
  tbsPesquisa.TabVisible := false;
  PageControl1.ActivePage := tbsCadastro;
  TclientdataSet(dsTabela.DataSet).Edit;
end;

procedure Tfrmcadastrobasico.aceditarUpdate(Sender: TObject);
begin
if not TClientDataSet(dsTabela.DataSet).IsEmpty then

aceditar.Enabled := dsTabela.State in [dsBrowse];
end;

procedure Tfrmcadastrobasico.acexcluirExecute(Sender: TObject);
begin
if Application.MessageBox('Deseja Relamente Excluir o Registro?', 'Pergunta',MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    try
      TClientDataSet(dsTabela.DataSet).Delete;
      TclientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      Application.MessageBox('Registro excluido com sucesso!', 'Informação', 0+64);
      TClientDataSet(dsTabela.DataSet).Open;

      except on E : Exception do

      raise Exception.Create('Erro ao Excluir Registro: ');


    end;
  end;
end;

procedure Tfrmcadastrobasico.acexcluirUpdate(Sender: TObject);
begin
if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then


  acexcluir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure Tfrmcadastrobasico.acfecharExecute(Sender: TObject);
begin
  close;
end;

procedure Tfrmcadastrobasico.acimprimirExecute(Sender: TObject);
begin
showmessage('Em Desenvolvimento')
end;

procedure Tfrmcadastrobasico.acimprimirUpdate(Sender: TObject);
begin
if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

acimprimir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure Tfrmcadastrobasico.acinserirExecute(Sender: TObject);
begin
iModo := 0;
if PageControl1.ActivePage = tbsPesquisa then
tbsCadastro.TabVisible := true;
tbsPesquisa.TabVisible := false;
  PageControl1.ActivePage := tbsCadastro;
if not TclientdataSet(dsTabela.DataSet).Active then
  TClientDataSet(dsTabela.DataSet).Open;
  TClientDataSet(dsTabela.DataSet).Insert;
end;

procedure Tfrmcadastrobasico.acinserirUpdate(Sender: TObject);
begin
acinserir.Enabled := dsTabela.State in [dsBrowse, dsInactive];
end;

procedure Tfrmcadastrobasico.acpesquisarExecute(Sender: TObject);
begin
PageCOntrol1.ActivePage := tbsPesquisa;
edtPesquisar.Clear;
end;

procedure Tfrmcadastrobasico.acsalvarExecute(Sender: TObject);
begin
try
TclientDataSet(dsTabela.DataSet).Post;
TclientDataSet(dsTabela.DataSet).ApplyUpdates(0);

    case iModo of
        0 : Application.MessageBox('Registro Inserido com Sucesso!', 'Informação',MB_OK+MB_ICONINFORMATION);
        1 : Application.MessageBox('Registro Atualizado com Sucesso!', 'Informação',MB_OK+MB_ICONINFORMATION);


    end;

    if PageControl1.Activepage = tbsCadastro then
      PageControl1.ActivePage := tbsPesquisa;


    //Limpar os campos
        LimparTudo;
        TclientDataSet(dsTabela.DataSet).Open;

except on E : Exception do
raise Exception.Create('Erro ao Salvar Registro: ');
end;
end;

procedure Tfrmcadastrobasico.acsalvarUpdate(Sender: TObject);
begin
acsalvar.Enabled := dsTabela.State in [dsinsert, dsedit];
end;

procedure Tfrmcadastrobasico.actcancelarUpdate(Sender: TObject);
begin
  accancelar.Enabled := acsalvar.Enabled = true;
end;

procedure Tfrmcadastrobasico.actexcluirExecute(Sender: TObject);
begin
if Application.MessageBox('Deseja Relamente Excluir o Registro?', 'Pergunta',MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    try
      TClientDataSet(dsTabela.DataSet).Delete;
      TclientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      Application.MessageBox('Registro excluido com sucesso!', 'Informação', 0+64);
    finally

    end;
  end;

end;

procedure Tfrmcadastrobasico.DbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
EditarDBGrid(dsTabela,dbgDados,State,Rect,Column);
end;

procedure Tfrmcadastrobasico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  TClientDataSet(dsTabela).Cancel;
//   TClientDataSet(dsTabela).Close;
end;

procedure Tfrmcadastrobasico.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #27 then
  close;

if key = #13 then
  Perform(WM_NEXTDLGCTL,0,0);

end;

procedure Tfrmcadastrobasico.LimparTudo;
var
  i: Integer;
begin
for i := 0 to ComponentCount -1 do
begin
  if components[i] is TCustomEdit then
    TCustomEdit(components[i]).Clear;
end;
if PageControl1.Activepage = tbsCadastro then
begin
      tbsCadastro.TabVisible := false;
      PageControl1.ActivePage := tbsPesquisa;
end;
edtpesquisar.SetFocus;
end;

procedure Tfrmcadastrobasico.tbsPesquisarShow(Sender: TObject);
begin
PageControl1.ActivePage := tbsPesquisa;
end;

end.
