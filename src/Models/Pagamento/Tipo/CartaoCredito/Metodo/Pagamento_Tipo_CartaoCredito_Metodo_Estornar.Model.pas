unit Pagamento_Tipo_CartaoCredito_Metodo_Estornar.Model;

interface

uses
  Pagamento.Model.Interf;

type
  TPagamentoTipoCartaoCreditoMetodoEstornarModel = class(TInterfacedObject, IPagamentoMetodoEstornarModel)
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

{ TPagamentoTipoCartaoCreditoMetodoEstornarModel }

function TPagamentoTipoCartaoCreditoMetodoEstornarModel.&End: IPagamentoTipoMetodoModel;
begin
  Result := FParent;
end;

constructor TPagamentoTipoCartaoCreditoMetodoEstornarModel.Create(Parent: IPagamentoTipoMetodoModel);
begin
  FParent := Parent;
end;

destructor TPagamentoTipoCartaoCreditoMetodoEstornarModel.Destroy;
begin

  inherited;
end;

class function TPagamentoTipoCartaoCreditoMetodoEstornarModel.New(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
begin
  Result := Self.Create(Parent);
end;

function TPagamentoTipoCartaoCreditoMetodoEstornarModel.SetIndex(
  Value: SmallInt): IPagamentoMetodoEstornarModel;
begin
  Result := Self;
  FIndex := Value;
end;

end.
