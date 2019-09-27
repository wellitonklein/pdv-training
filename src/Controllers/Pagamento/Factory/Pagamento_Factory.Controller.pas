unit Pagamento_Factory.Controller;

interface

uses
  Pagamento_Factory.Controller.Interf,
  Pagamento.Controller.Interf,
  Pagamento_Operacoes.Controller.Interf;

type
  TPagamentoFactoryController = class(TInterfacedObject, IPagamentoFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoFactoryController;
    function Pagamento: IPagamentoController;
    function Operacoes: IPagamentoOperacoesController;
  end;

implementation

uses
  Pagamento.Controller, Pagamento_Operacoes.Controller;

{ TPagamentoFactoryController }

constructor TPagamentoFactoryController.Create;
begin

end;

destructor TPagamentoFactoryController.Destroy;
begin

  inherited;
end;

class function TPagamentoFactoryController.New: IPagamentoFactoryController;
begin
  Result := Self.Create;
end;

function TPagamentoFactoryController.Operacoes: IPagamentoOperacoesController;
begin
  Result := TPagamentoOperacoesController.New;
end;

function TPagamentoFactoryController.Pagamento: IPagamentoController;
begin
  Result := TPagamentoController.New;
end;

end.
