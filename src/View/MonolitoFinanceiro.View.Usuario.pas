unit MonolitoFinanceiro.View.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.Menus;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    edtNome: TEdit;
    edtLogin: TEdit;
    ToggleStatus: TToggleSwitch;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    mnuLimparSenha: TMenuItem;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure mnuLimparSenhaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses Monolito.Financeiro.Model.Usuarios,
  Monolito.Financeiro.Utilitarios,
  BCrypt,
  MonolitoFinanceiro.View.Relatorios.Usuarios;

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  edtNome.Text := dmUsuarios.cdsUsuariosNome.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuariosLogin.AsString;
  ToggleStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosstatus.AsString = 'B' then
    ToggleStatus.State := tssOff;
end;

procedure TfrmUsuarios.btnImprimirClick(Sender: TObject);
begin
  relUsuarios.DataSet(DataSource1.DataSet);
  relUsuarios.Preview;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O campo nome n�o pode ser vazio.', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if Trim(edtLogin.Text) = '' then
  begin
    edtlogin.SetFocus;
    Application.MessageBox('O campo login n�o pode ser vazio.', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
  begin
    edtlogin.SetFocus;
    Application.MessageBox(PWideChar(Format('O login %s j� se encontra cadastrado.', [edtLogin.Text])), 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  LStatus := 'A';
  if ToggleStatus.State = tssOff then
    LStatus := 'B';

  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    dmUsuarios.cdsUsuariosID.AsString := TUtilitarios.GetID;
    dmUsuarios.cdsUsuariosData_Cadastro.AsDateTime := Now;
    dmUsuarios.cdsUsuariosSenha.AsString := TBCrypt.GenerateHash(dmUsuarios.TEMP_PASSWORD);
    dmUsuarios.cdsUsuariossenha_temporaria.Asstring := 'S';
  end;

  dmUsuarios.cdsUsuariosNome.AsString  := Trim(edtNome.Text);
  dmUsuarios.cdsUsuariosLogin.AsString := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariosStatus.AsString := LStatus;

  inherited;
end;

procedure TfrmUsuarios.mnuLimparSenhaClick(Sender: TObject);
begin
  inherited;
  if not dmUsuarios.GetUsuarioLogado.Administrador then
  begin
    Application.MessageBox(PWideChar('Somente Administradores podem redefinir a senha'), 'Erro', MB_OK + MB_ICONERROR);;
    abort;
  end;
  if not DataSource1.DataSet.IsEmpty then
  begin
    dmUsuarios.LimparSenha(DataSource1.DataSet.FieldByName('ID').AsString);
    Application.MessageBox(PWideChar(format('Foi definida a senha padr�o para o usu�rio "%s"',[DataSource1.DataSet.FieldByName('NOME').AsString])), 'Aten��o', MB_OK + MB_ICONINFORMATION);;
  end;
end;

procedure TfrmUsuarios.Pesquisar;
var
  FiltroPesquisa: String;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text, DBGrid1);

  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS WHERE 1 = 1' + FiltroPesquisa;
  dmUsuarios.cdsUsuarios.Open;
  inherited;
end;

end.
