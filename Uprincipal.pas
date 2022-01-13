unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Buttons;

type
  Tfrmprincipal = class(TForm)
    Label1: TLabel;
    imgusuarios: TImage;
    imgreceber: TImage;
    imcpagar: TImage;
    imgconreceber: TImage;
    imgcaixa: TImage;
    imgconpagar: TImage;
    Label3: TLabel;
    Label4: TLabel;
    imgrelpagar: TImage;
    Image3: TImage;
    imgnavegador: TImage;
    imgconfig: TImage;
    imgrelreceber: TImage;
    imgrelcaixa: TImage;
    BalloonHint1: TBalloonHint;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure imgusuariosClick(Sender: TObject);
    procedure imgreceberClick(Sender: TObject);
    procedure imcpagarClick(Sender: TObject);
    procedure imgcaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.dfm}

uses ufrmCadastroBasico, ufrmCadastroUsuarios, ufrmCadastroCaixa,
  ufrmCadastroPagar, ufrmCadastroReceber, ModConexao, UFuncoes;


procedure Tfrmprincipal.BitBtn1Click(Sender: TObject);
begin
  frmcadastrobasico := TfrmCadastroBasico.Create(Nil);
  try
    frmCadastroBasico.ShowModal;

  finally
    FreeAndNil(frmcadastrobasico);
end;
end;

procedure Tfrmprincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Application.MessageBox('Deseja Realmente Sair?', 'Informação', MB_YESNO+MB_ICONQUESTION)= mrYes then

Application.Terminate

else
Abort;
end;

procedure Tfrmprincipal.imcpagarClick(Sender: TObject);
begin
  frmcadastropagar := Tfrmcadastropagar.Create(nil);
  try
      frmCadastropagar.ShowModal;

    finally
      FreeAndNil(frmcadastropagar);
  end;
end;

procedure Tfrmprincipal.imgcaixaClick(Sender: TObject);
begin
  frmcadastroreceber := Tfrmcadastroreceber.Create(nil);
  try
      frmCadastroreceber.ShowModal;

    finally
      FreeAndNil(frmcadastroreceber);
  end;
end;

procedure Tfrmprincipal.imgreceberClick(Sender: TObject);
begin
  frmcadastrocaixa := Tfrmcadastrocaixa.Create(nil);
  try
      frmCadastrocaixa.ShowModal;

    finally
      FreeAndNil(frmcadastrocaixa);
  end;
end;

procedure Tfrmprincipal.imgusuariosClick(Sender: TObject);
begin
  frmcadastrousuarios := Tfrmcadastrousuarios.Create(nil);
  try
      frmCadastrousuarios.ShowModal;

    finally
      FreeAndNil(frmcadastrousuarios);
  end;
end;

procedure Tfrmprincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now)   ;

end;

end.
