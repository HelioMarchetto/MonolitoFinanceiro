unit MonolitoFinanceiro.Entidades.ContaReceber.Detalhes;

interface

type
  TModelContaReceberDetalhe = class
    private
    FValor: Currency;
    FIDContaReceber: String;
    FDetalhes: String;
    FID: String;
    FUsuario: String;
    FData: TDate;
    procedure SetData(const Value: TDate);
    procedure SetDetalhes(const Value: String);
    procedure SetID(const Value: String);
    procedure SetIDContaReceber(const Value: String);
    procedure SetUsuario(const Value: String);
    procedure SetValor(const Value: Currency);
    public
      property ID: String read FID write SetID;
      property IDContaReceber: String read FIDContaReceber write SetIDContaReceber;
      property Detalhes: String read FDetalhes write SetDetalhes;
      property Valor: Currency read FValor write SetValor;
      property Data: TDate read FData write SetData;
      property Usuario: String read FUsuario write SetUsuario;
end;

implementation

{ TModelContaReceberDetalhe }

procedure TModelContaReceberDetalhe.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TModelContaReceberDetalhe.SetDetalhes(const Value: String);
begin
  FDetalhes := Value;
end;

procedure TModelContaReceberDetalhe.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TModelContaReceberDetalhe.SetIDContaReceber(const Value: String);
begin
  FIDContaReceber := Value;
end;

procedure TModelContaReceberDetalhe.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;

procedure TModelContaReceberDetalhe.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
