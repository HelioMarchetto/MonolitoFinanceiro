unit Monolito.Financeiro.Utilitarios;

interface

uses
  Vcl.DBGrids;
type
  TUtilitarios = class
    class Function GetID : String;
    class function LikeFind(Pesquisa: String; Grid: TDBGrid): string;
    class function FormatoMoeda(aValue : Currency): String;
  end;
implementation

{ TUtilitarios }

uses
  System.SysUtils;

class function TUtilitarios.FormatoMoeda(aValue: Currency): String;
begin
  Result := Format('%m', [aValue]);
end;

class function TUtilitarios.GetID: String;
begin
  Result := TGuid.NewGuid.ToString;
  Result := StringReplace(Result, '{', '',[rfReplaceAll]);
  Result := StringReplace(Result, '}', '',[rfReplaceAll]);
end;

class function TUtilitarios.LikeFind(Pesquisa: String; Grid: TDBGrid): string;
var
  LContador: Integer;
begin
  Result := '';
  if Pesquisa.Trim.IsEmpty then
    exit;
  for LContador := 0 to Pred(Grid.Columns.Count) do
    Result := Result + Grid.Columns.Items[LContador].FieldName +
      ' LIKE ' + QuotedStr('%' + Trim(Pesquisa) + '%') + ' OR ';
  Result := ' AND (' + Copy(Result, 1, length (Result) - 4) + ')';
end;

end.
