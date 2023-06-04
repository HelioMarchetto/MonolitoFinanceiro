unit MonolitoFinanceiro.View.ContasReceber.Baixar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TfrmContasReceberBaixar = class(TForm)
    pnlPrincipal: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblDocumento: TLabel;
    lblParcela: TLabel;
    lblValorParcela: TLabel;
    lblVencimento: TLabel;
    lblValorAbatido: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    edtObservacao: TEdit;
    edtValor: TEdit;
    Panel3: TPanel;
    btnCancelar: TButton;
    btnBaixar: TButton;
    ImageList1: TImageList;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    { Private declarations }
    FID : String;
  public
    { Public declarations }
    procedure BaixarContaReceber(ID: String);
  end;

var
  frmContasReceberBaixar: TfrmContasReceberBaixar;

implementation

uses
  MonolitoFinanceiro.Entidades.ContaReceber,
  MonolitoFinanceiro.Model.ContasPagar, Monolito.Financeiro.Utilitarios,
  MonolitoFinanceiro.Entidades.ContaReceber.Detalhes,
  Monolito.Financeiro.Model.Usuarios, MonolitoFinanceiro.Model.ContasReceber,
  MonolitoFinanceiro.Entidades.ContaPagar.Detalhes;

{$R *.dfm}

{ TfrmContasPagarBaixar }

procedure TfrmContasReceberBaixar.BaixarContaReceber(ID: String);
var
  ContaReceber : TModelContaReceber;
begin
  FID := Trim(ID);
  if FID.IsEmpty then
    raise Exception.Create('ID do contas a receber inválido');

  ContaReceber := dmContasReceber.GetContaReceber(FID);
  try
    if ContaReceber.Status = 'B' then
      raise Exception.Create('Não é possível baixar um documento baixado');

    if ContaReceber.Status = 'C' then
      raise Exception.Create('Não é possível baixar um documento cancelado');

    lblDocumento.Caption := ContaReceber.Documento;
    lblParcela.Caption := IntToStr(ContaReceber.Parcela);
    lblVencimento.Caption := FormatDateTime('dd/mm/yyyy', ContaReceber.DataVencimento);
    lblValorAbatido.Caption := TUtilitarios.FormatarValor(ContaReceber.ValorAbatido);
    lblValorParcela.Caption := TUtilitarios.FormatarValor(ContaReceber.ValorParcela);
    edtObservacao.Text := '';
    edtValor.Text := '';

    Self.ShowModal;
  finally
    ContaReceber.Free
  end;
end;

procedure TfrmContasReceberBaixar.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmContasReceberBaixar.edtValorExit(Sender: TObject);
begin
  edtValor.Text := TUtilitarios.FormatarValor(edtValor.Text);
end;

procedure TfrmContasReceberBaixar.FormCreate(Sender: TObject);
begin
  edtValor.OnKeyPress := TUtilitarios.KeyPressValor;
end;

procedure TfrmContasReceberBaixar.btnBaixarClick(Sender: TObject);
var
  ContaReceberDetalhe : TModelContaReceberDetalhe;
  ValorAbater : Currency;
begin
  if Trim(edtObservacao.Text) = '' then
  begin
    edtObservacao.SetFocus;
    Application.MessageBox('A observação não pode ser vazia', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  ValorAbater := 0;
  TryStrToCurr(edtValor.Text, ValorAbater);

  if ValorAbater <= 0 then
  begin
    edtValor.SetFocus;
    Application.MessageBox('Valor inválido', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  ContaReceberDetalhe := TModelContaReceberDetalhe.Create;
  try
    ContaReceberDetalhe.IDContaReceber := FID;
    ContaReceberDetalhe.Detalhes := edtObservacao.Text;
    ContaReceberDetalhe.Valor := ValorAbater;
    ContaReceberDetalhe.Data := Now;
    ContaReceberDetalhe.Usuario := dmUsuarios.GetUsuarioLogado.ID;

    try
      dmContasReceber.BaixarContaReceber(ContaReceberDetalhe);
      Application.MessageBox('Documento baixado com sucesso', 'Sucesso', MB_OK + MB_ICONINFORMATION);
      ModalResult := mrOk;
    except on E : Exception do
      Application.MessageBox(PWideChar(E.Message), 'Erro ao baixar documento', MB_OK + MB_ICONWARNING);
    end;
  finally
    ContaReceberDetalhe.Free;
  end;

end;

end.

