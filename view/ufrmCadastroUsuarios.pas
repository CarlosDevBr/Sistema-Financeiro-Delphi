unit ufrmCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  FireDAC.Phys.MySQLDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tfrmcadastrousuarios = class(Tfrmcadastrobasico)
    Label2: TLabel;
    Label5: TLabel;
    edtnome: TEdit;
    edtlogin: TEdit;
    edtsenha: TEdit;
    procedure acsalvarExecute(Sender: TObject);
    procedure aceditarExecute(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure acpesquisarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadastrousuarios: Tfrmcadastrousuarios;

implementation

{$R *.dfm}

uses UFuncoes, ModConexao;

procedure Tfrmcadastrousuarios.aceditarExecute(Sender: TObject);
begin
  inherited;
  edtNome.Text := dmDados.cdsusuariosnome.AsString;
    edtLogin.Text := dmDados.cdsusuarioslogin.AsString;
      edtSenha.Text := dmDados.cdsusuariossenha.AsString;
end;

procedure Tfrmcadastrousuarios.acpesquisarExecute(Sender: TObject);
begin
  inherited;
dmDados.cdsusuarios.Close;
dmDados.cdsusuarios.CommandText := 'SELECT * FROM USUARIOS';
dmDados.cdsusuarios.Open;
end;

procedure Tfrmcadastrousuarios.acsalvarExecute(Sender: TObject);
begin
if (dsTabela.State in [dsInsert]) and (GetLoginCadastro(trim(edtLogin.Text))) then
  Application.MessageBox('O login já está Cadastrado!', 'Atenção', MB_OK+MB_ICONWARNING);
  edtLogin.SetFocus;
if Trim(edtnome.text) = '' then
  begin
    Application.MessageBox('Preencha o campo Nome!', 'Atenção', MB_OK+MB_ICONWARNING);
    edtnome.SetFocus;
    Abort;
  end;
  if Trim(edtlogin.text) = '' then
  begin
    Application.MessageBox('Preencha o campo Login!', 'Atenção', MB_OK+MB_ICONWARNING);
    edtlogin.SetFocus;
    Abort;
  end;
  if Trim(edtsenha.text) = '' then
  begin
    Application.MessageBox('Preencha o campo Senha!', 'Atenção', MB_OK+MB_ICONWARNING);
    edtsenha.SetFocus;
    Abort;
  end;

  if dsTabela.State in [dsInsert] then



  dmDados.cdsusuariosid.AsInteger := GetId('ID','USUARIOS');
  dmDados.cdsusuariosnome.AsString := Trim(edtNome.Text);
  dmDados.cdsusuarioslogin.AsString := Trim(edtLogin.Text);
  dmDados.cdsusuariossenha.AsString := Trim(edtSenha.Text);
  dmDados.cdsusuariosstatus.AsString := 'A';
  dmDados.cdsusuariosdt_cadastro.AsDateTime := now;
  inherited;

end;

procedure Tfrmcadastrousuarios.btnfiltrarClick(Sender: TObject);
begin
if edtpesquisar.Text = '' then

begin
  Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
  edtpesquisar.SetFocus;
  Abort;
end;
  inherited;
  dmDados.cdsusuarios.Close;
  case cbxfiltros.ItemIndex of
  0 : dmDados.cdsusuarios.CommandText := 'SELECT * FROM USUARIOS WHERE NOME LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  1 : dmDados.cdsusuarios.CommandText := 'SELECT * FROM USUARIOS WHERE LOGIN LIKE '+QuotedStr('%'+edtPesquisar.Text+'%');
  end;
  dmDados.cdsusuarios.Open;
end;

end.
