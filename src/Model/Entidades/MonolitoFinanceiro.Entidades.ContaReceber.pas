unit MonolitoFinanceiro.Entidades.ContaReceber;

interface

type

TModelContaReceber = class
  private
    FDataVenda: TDate;
    FValorParcela: Currency;
    FValorVenda: Currency;
    FDescricao: string;
    FDataVencimento: TDate;
    FDocumento: string;
    FID: string;
    FValorAbatido: Currency;
    FStatus: String;
    FDataCadastro: TDate;
    FDataRecebimento: TDate;
    FParcela: Integer;
    procedure SetDataCadastro(const Value: TDate);
    procedure SetDataRecebimento(const Value: TDate);
    procedure SetDataVencimento(const Value: TDate);
    procedure SetDataVenda(const Value: TDate);
    procedure SetDescricao(const Value: string);
    procedure SetDocumento(const Value: string);
    procedure SetID(const Value: string);
    procedure SetParcela(const Value: Integer);
    procedure SetStatus(const Value: String);
    procedure SetValorAbatido(const Value: Currency);
    procedure SetValorParcela(const Value: Currency);
    procedure SetValorVenda(const Value: Currency);
  public
      property ID: string read FID write SetID;
      property Documento: string read FDocumento write SetDocumento;
      property Descricao: string read FDescricao write SetDescricao;
      property Parcela: Integer read FParcela write SetParcela;
      property ValorParcela: Currency read FValorParcela write SetValorParcela;
      property ValorVenda: Currency read FValorVenda write SetValorVenda;
      property ValorAbatido: Currency read FValorAbatido write SetValorAbatido;
      property DataVenda: TDate read FDataVenda write SetDataVenda;
      property DataCadastro: TDate read FDataCadastro write SetDataCadastro;
      property DataVencimento: TDate read FDataVencimento write SetDataVencimento;
      property DataRecebimento: TDate read FDataRecebimento write SetDataRecebimento;
      property Status: String read FStatus write SetStatus;
end;

implementation

{ TModelContaReceber }

procedure TModelContaReceber.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TModelContaReceber.SetDataRecebimento(const Value: TDate);
begin
  FDataRecebimento := Value;
end;

procedure TModelContaReceber.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TModelContaReceber.SetDataVenda(const Value: TDate);
begin
  FDataVenda := Value;
end;

procedure TModelContaReceber.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TModelContaReceber.SetDocumento(const Value: string);
begin
  FDocumento := Value;
end;

procedure TModelContaReceber.SetID(const Value: string);
begin
  FID := Value;
end;

procedure TModelContaReceber.SetParcela(const Value: Integer);
begin
  FParcela := Value;
end;

procedure TModelContaReceber.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TModelContaReceber.SetValorAbatido(const Value: Currency);
begin
  FValorAbatido := Value;
end;

procedure TModelContaReceber.SetValorParcela(const Value: Currency);
begin
  FValorParcela := Value;
end;

procedure TModelContaReceber.SetValorVenda(const Value: Currency);
begin
  FValorVenda := Value;
end;

end.
