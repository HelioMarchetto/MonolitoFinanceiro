unit MonolitoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, MonolitoFinanceiro.View.Usuario,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuUsuarios: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    menuFinanceiro: TMenuItem;
    menuCaixa: TMenuItem;
    mnuResumoCaixa: TMenuItem;
    mnuContasPagar: TMenuItem;
    procedure mnuUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure menuCaixaClick(Sender: TObject);
    procedure mnuResumoCaixaClick(Sender: TObject);
    procedure mnuContasPagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  MonolitoFinanceiro.View.Splash, MonolitoFinanceiro.View.Login,
  Monolito.Financeiro.Model.Usuarios, MonolitoFinanceiro.View.RedefinirSenha,
  MonolitoFinanceiro.View.Caixa, MonolitoFinanceiro.View.Caixa.Saldo,
  MonolitoFinanceiro.View.ContasPagar;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmSplash := TFrmSplash.Create(nil);
  try
    frmSplash.ShowModal;
  finally
    FreeAndNil(frmSplash);
  end;

  frmLogin := Tfrmlogin.Create(nil);
  try
    frmLogin.ShowModal;
    if frmLogin.ModalResult <> mrOk then
      Application.Terminate;
  finally
    FreeAndNil(frmLogin);
  end;

  if dmUsuarios.GetUsuarioLogado.SenhaTemporaria  then
  begin
    frmRedefinirSenha := TfrmRedefinirSenha.Create(nil);
    try
      frmRedefinirSenha.Usuario := dmUsuarios.GetUsuarioLogado;
      frmRedefinirSenha.ShowModal;
      if frmRedefinirSenha.ModalResult <> mrOk then
        Application.terminate;
    finally
      FreeAndNil(frmRedefinirSenha);
    end;
  end;


  StatusBar1.Panels.Items[1].Text := 'Usuário: ' + dmUsuarios.GetUsuarioLogado.Nome;
end;

procedure TfrmPrincipal.menuCaixaClick(Sender: TObject);
begin
  frmCaixa.Show;
end;

procedure TfrmPrincipal.mnuContasPagarClick(Sender: TObject);
begin
  frmContasPagar.Show;
end;

procedure TfrmPrincipal.mnuResumoCaixaClick(Sender: TObject);
begin
  frmCaixaSaldo.Show;
end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
begin
  frmUsuarios.Show;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(Now);
end;

end.
