unit Pagamento_Tipo_Factory.Controller;

interface

uses
  Pagamento_Tipo_Factory.Controller.Interf, Pagamento.Controller.Interf,
  Venda.Controller.Interf;

type
  TPagamentoTipoFactoryController = class(TInterfacedObject, IPagamentoTipoFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoTipoFactoryController;
    function Dinheiro(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
    function CartaoCredito(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
  end;

implementation

uses
  Pagamento_Tipo_CartaoCredito.Controller,
  Pagamento_Tipo_Dinheiro.Controller;

{ TPagamentoTipoFactoryController }

function TPagamentoTipoFactoryController.CartaoCredito(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
begin
  Result := TPagamentoTipoCartaoCreditoController.New(Parent, Venda);
end;

constructor TPagamentoTipoFactoryController.Create;
begin

end;

destructor TPagamentoTipoFactoryController.Destroy;
begin

  inherited;
end;

function TPagamentoTipoFactoryController.Dinheiro(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
begin
  Result := TPagamentoTipoDinheiroController.New(Parent, Venda);
end;

class function TPagamentoTipoFactoryController.New: IPagamentoTipoFactoryController;
begin
  Result := Self.Create;
end;

end.
