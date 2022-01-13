program Sistema_Financas;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {frmprincipal},
  Vcl.Themes,
  Vcl.Styles,
  ModConexao in 'ModConexao.pas' {dmDados: TDataModule},
  ufrmCadastroBasico in 'view\ufrmCadastroBasico.pas' {frmcadastrobasico},
  ufrmCadastroUsuarios in 'view\ufrmCadastroUsuarios.pas' {frmcadastrousuarios},
  UFuncoes in 'classes\UFuncoes.pas',
  ufrmCadastroCaixa in 'view\ufrmCadastroCaixa.pas' {frmcadastrocaixa},
  ufrmCadastroPagar in 'view\ufrmCadastroPagar.pas' {frmcadastropagar},
  ufrmCadastroReceber in 'view\ufrmCadastroReceber.pas' {frmcadastroreceber},
  udmRelatorios in 'datamodule\udmRelatorios.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
