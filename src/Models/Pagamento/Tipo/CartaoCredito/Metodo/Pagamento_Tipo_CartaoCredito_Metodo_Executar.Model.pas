unit Pagamento_Tipo_CartaoCredito_Metodo_Executar.Model;

interface

uses
  Pagamento.Model.Interf;

type
  TPagamentoTipoCartaoCreditoMetodoExecutarModel = class(TInterfacedObject, IPagamentoMetodoExecutarModel)
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

uses
  PDVUpdates.Model,
  PDVUpdates_Type.Controller;

{ TPagamentoTipoCartaoCreditoMetodoExecutarModel }

function TPagamentoTipoCartaoCreditoMetodoExecutarModel.&End: IPagamentoTipoMetodoModel;
begin
  Result := FParent;

  FParent.&End.Entidade(TPDVUpdatesModel.New.Entidade.VendaPagamentos);
  FParent.&End.Entidade.TIPO  := Integer(tpCartaoCredito);
  FParent.&End.Entidade.VALOR := FValor;
  FParent.&End.DAO.Insert(FParent.&End.Entidade);
end;

constructor TPagamentoTipoCartaoCreditoMetodoExecutarModel.Create(Parent: IPagamentoTipoMetodoModel);
begin
  FParent := Parent;
end;

destructor TPagamentoTipoCartaoCreditoMetodoExecutarModel.Destroy;
begin

  inherited;
end;

class function TPagamentoTipoCartaoCreditoMetodoExecutarModel.New(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoExecutarModel;
begin
  Result := Self.Create(Parent);
end;

function TPagamentoTipoCartaoCreditoMetodoExecutarModel.SetValor(
  Value: Currency): IPagamentoMetodoExecutarModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
