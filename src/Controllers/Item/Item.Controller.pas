unit Item.Controller;

interface

uses
  Item.Controller.Interf, Venda.Controller.Interf;

type
  TItemController = class(TInterfacedObject, IItemController)
  private
    FMetodo: IItemMetodoController;
    FVendaController: IVendaController;
  public
    constructor Create(Venda: IVendaController);
    destructor Destroy; override;
    class function New(Venda: IVendaController): IItemController;
    function Metodo: IItemMetodoController;
    function Venda: IVendaController;
  end;

implementation

uses
  Item_Metodo.Controller;

{ TItemController }

constructor TItemController.Create(Venda: IVendaController);
begin
  FVendaController := Venda;
  FMetodo := TItemMetodoController.New(Self);
end;

destructor TItemController.Destroy;
begin

  inherited;
end;

function TItemController.Metodo: IItemMetodoController;
begin
  Result := FMetodo;
end;

class function TItemController.New(Venda: IVendaController): IItemController;
begin
  Result := Self.Create(Venda);
end;

function TItemController.Venda: IVendaController;
begin
  Result := FVendaController;
end;

end.
