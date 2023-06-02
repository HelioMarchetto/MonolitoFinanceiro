unit MonolitoFinanceiro.Entidades.ContaPagar.Detalhes;

interface

type
  TModelContaPagarDetalhe = class
    private
      FID: String;
      FIDContaPagar: String;
      FDetalhes: String;
      FValor: Currency;
      FData: TDate;
      FUsuarui: String;
      FUsuario: String;
      procedure SetID(const Value: String);
      procedure SetIDContaPagar(const Value: String);
      procedure SetDetalhes(const Value: String);
      procedure SetValor(const Value: Currency);
      procedure SetData(const Value: TDate);
      procedure SetUsuario(const Value: String);
    public
      property ID: String read FID write SetID;
      property IDContaPagar: String read FIDContaPagar write SetIDContaPagar;
      property Detalhes: String read FDetalhes write SetDetalhes;
      property Valor: Currency read FValor write SetValor;
      property Data: TDate read FData write SetData;
      property Usuario: String read FUsuario write SetUsuario;
  end;

implementation

{ TModelContaPagarDetalhe }

procedure TModelContaPagarDetalhe.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TModelContaPagarDetalhe.SetDetalhes(const Value: String);
begin
  FDetalhes := Value;
end;

procedure TModelContaPagarDetalhe.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TModelContaPagarDetalhe.SetIDContaPagar(const Value: String);
begin
  FIDContaPagar := Value;
end;

procedure TModelContaPagarDetalhe.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;

procedure TModelContaPagarDetalhe.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
