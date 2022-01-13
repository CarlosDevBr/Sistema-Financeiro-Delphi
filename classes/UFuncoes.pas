unit UFuncoes;


interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  ufrmCadastroBasico,
  FireDAC.Stan.Intf,
  System.Actions,
  Vcl.ActnList,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.SqlExpr,
  FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Data.DBXMySQL,
  Data.FMTBcd,
  Datasnap.Provider,
  Datasnap.DBClient;

function GetId(Campo, Tabela : String) : Integer;
function GetLoginCadastro(Login : String) : Boolean;
procedure EditarDBGrid(DataSource : TDataSource; Sender : TDBGrid; State : TGridDrawState; Rect : TRect; Column : Tcolumn);
function StringToFloat(s : string) : Extended;
implementation

uses ModConexao, ufrmCadastroUsuarios;

function GetId(Campo, Tabela : String) : Integer;
begin
  with
  //_query := TFDQuery.Create(nil);
  //_query.Connection := dmDados.FDConnection1;
  TSQLQuery.Create(nil) do
  try
    SQLConnection := dmDados.SQLConnection;
    sql.Add('SELECT '+Campo+' FROM '+Tabela+' ORDER BY '+Campo+' DESC LIMIT 1');
    Open;
    Result := Fields[0].AsInteger + 1;
    //_query.SQL.Text := 'SELECT '+Campo+' FROM '+Tabela+' ORDER BY '+Campo+' DESC LIMIT 1';

    //_query.Open;

    //Result := _query.FieldByName('ID').AsInteger + 1;
  finally
    Close;
    Free;
    //_query.Close;
    //_query.Free;
  end;
end;

  function GetLoginCadastro(Login : String) : Boolean;
  begin
    result := false;
    with
    TSQLQuery.Create(nil) do

    try
    SQLConnection := DmDados.SQLConnection;
    Sql.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN');
    Params[0].AsString := Login;
    Open;
    if not IsEmpty then
        result := true;
    finally
    Close;
    Free;
    end;
  end;
      procedure EditarDBGrid(DataSource : TDataSource; Sender : TDBGrid; State : TGridDrawState; Rect : TRect; Column : Tcolumn);
      begin
        if not odd(DataSource.DataSet.RecNo) then
        begin
          if not (gdSelected in state) then
          begin
            Sender.Canvas.Brush.Color := $00FFEFDF;
            Sender.Canvas.FillRect(Rect);
            Sender.DefaultDrawDataCell(Rect,Column.Field,State);
          end;
        end;

      end;

      function StringToFloat(s : string) : Extended;
{ Filtra uma string qualquer, convertendo as suas partes
  numéricas para sua representação decimal, por exemplo:
  'R$ 1.200,00' para 1200,00 '1AB34TZ' para 134}
var
  i :Integer;
  t : string;
  SeenDecimal,SeenSgn : Boolean;
begin
   t := '';
   SeenDecimal := False;
   SeenSgn := False;
   {Percorre os caracteres da string:}
   for i := Length(s) downto 0 do
  {Filtra a string, aceitando somente números e separador decimal:}

     if (s[i] in ['0'..'9', '-','+',',']) then
     begin
        if (s[i] = ',') and (not SeenDecimal) then
        begin
           t := s[i] + t;
           SeenDecimal := True;
        end
        else if (s[i] in ['+','-']) and (not SeenSgn) and (i = 1) then
        begin
           t := s[i] + t;
           SeenSgn := True;
        end
        else if s[i] in ['0'..'9'] then
        begin
           t := s[i] + t;
        end;
     end;
   Result := StrToFloat(t);
end;
end.
