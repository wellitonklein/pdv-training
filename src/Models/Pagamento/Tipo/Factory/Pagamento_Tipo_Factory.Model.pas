unit Pagamento_Tipo_Factory.Model;

interface

uses
  Pagamento.Model.Interf;

type
  TPagamentoTipoFactoryModel = class(TInterfacedObject, IPagamentoTipoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoTipoFactoryModel;
    function Dinheiro(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
    function CartaoCredito(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
  end;

implementation

uses
  Pagamento_Tipo_Dinheiro.Model,
  Pagamento_Tipo_CartaoCredito.Model;

{ TPagamentoTipoFactoryModel }

function TPagamentoTipoFactoryModel.CartaoCredito(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
begin
  Result := TPagamentoTipoCartaoCreditoModel.New(Parent);
end;

constructor TPagamentoTipoFactoryModel.Create;
begin

end;

destructor TPagamentoTipoFactoryModel.Destroy;
begin

  inherited;
end;

function TPagamentoTipoFactoryModel.Dinheiro(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
begin
  Result := TPagamentoTipoDinheiroModel.New(Parent);
end;

class function TPagamentoTipoFactoryModel.New: IPagamentoTipoFactoryModel;
begin
  Result := Self.Create;
end;

end.
