unit Pagamento_Tipo_Factory.Model;

interface

uses
  Pagamento_Tipo_Factory.Model.Interf,
  Pagamento.Model.Interf, Venda.Model.Inerf;

type
  TPagamentoTipoFactoryModel = class(TInterfacedObject, IPagamentoTipoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoTipoFactoryModel;
    function Dinheiro(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
    function CartaoCredito(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
  end;

implementation

uses
  Pagamento_Tipo_Dinheiro.Model,
  Pagamento_Tipo_CartaoCredito.Model;

{ TPagamentoTipoFactoryModel }

function TPagamentoTipoFactoryModel.CartaoCredito(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
begin
  Result := TPagamentoTipoCartaoCreditoModel.New(Parent, Venda);
end;

constructor TPagamentoTipoFactoryModel.Create;
begin

end;

destructor TPagamentoTipoFactoryModel.Destroy;
begin

  inherited;
end;

function TPagamentoTipoFactoryModel.Dinheiro(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
begin
  Result := TPagamentoTipoDinheiroModel.New(Parent, Venda);
end;

class function TPagamentoTipoFactoryModel.New: IPagamentoTipoFactoryModel;
begin
  Result := Self.Create;
end;

end.
