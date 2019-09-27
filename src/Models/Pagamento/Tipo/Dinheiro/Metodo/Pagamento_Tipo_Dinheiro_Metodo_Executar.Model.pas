unit Pagamento_Tipo_Dinheiro_Metodo_Executar.Model;

interface

uses
  Pagamento.Model.Interf;

type
  TPagamentoTipoDinheiroMetodoExecutarModel = class(TInterfacedObject, IPagamentoMetodoExecutarModel)
  private
    FParent: IPagamentoTipoMetodoModel;
    FValor: Currency;
  public
    constructor Create(Parent: IPagamentoTipoMetodoModel);
    destructor Destroy; override;
    class function New(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoExecutarModel;
    function SetValor(Value: Currency): IPagamentoMetodoExecutarModel;
    function &End: IPagamentoTipoMetodoModel;
  end;

implementation

{ TPagamentoTipoDinheiroMetodoExecutarModel }

function TPagamentoTipoDinheiroMetodoExecutarModel.&End: IPagamentoTipoMetodoModel;
begin
  Result := FParent;
end;

constructor TPagamentoTipoDinheiroMetodoExecutarModel.Create(Parent: IPagamentoTipoMetodoModel);
begin
  FParent := Parent;
end;

destructor TPagamentoTipoDinheiroMetodoExecutarModel.Destroy;
begin

  inherited;
end;

class function TPagamentoTipoDinheiroMetodoExecutarModel.New(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoExecutarModel;
begin
  Result := Self.Create(Parent);
end;

function TPagamentoTipoDinheiroMetodoExecutarModel.SetValor(
  Value: Currency): IPagamentoMetodoExecutarModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
