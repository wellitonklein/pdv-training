unit Pagamento_Tipo_Dinheiro_Metodo_Estornar.Model;

interface

uses
  Pagamento.Model.Interf;

type
  TPagamentoTipoDinheiroMetodoEstornarModel = class(TInterfacedObject, IPagamentoMetodoEstornarModel)
  private
    FParent: IPagamentoTipoMetodoModel;
    FIndex: SmallInt;
  public
    constructor Create(Parent: IPagamentoTipoMetodoModel);
    destructor Destroy; override;
    class function New(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
    function SetIndex(Value: SmallInt): IPagamentoMetodoEstornarModel;
    function &End: IPagamentoTipoMetodoModel;
  end;

implementation

{ TPagamentoTipoDinheiroMetodoEstornarModel }

function TPagamentoTipoDinheiroMetodoEstornarModel.&End: IPagamentoTipoMetodoModel;
begin
  Result := FParent;
end;

constructor TPagamentoTipoDinheiroMetodoEstornarModel.Create(Parent: IPagamentoTipoMetodoModel);
begin
  FParent := Parent;
end;

destructor TPagamentoTipoDinheiroMetodoEstornarModel.Destroy;
begin

  inherited;
end;

class function TPagamentoTipoDinheiroMetodoEstornarModel.New(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
begin
  Result := Self.Create(Parent);
end;

function TPagamentoTipoDinheiroMetodoEstornarModel.SetIndex(
  Value: SmallInt): IPagamentoMetodoEstornarModel;
begin
  Result := Self;
  FIndex := Value;
end;

end.
