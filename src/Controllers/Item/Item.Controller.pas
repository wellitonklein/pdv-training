unit Item.Controller;

interface

uses
  Item.Controller.Interf;

type
  TItemController = class(TInterfacedObject, IItemController)
  private
    FMetodo: IItemMetodoController;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemController;
    function Metodo: IItemMetodoController;
  end;

implementation

uses
  Item_Metodo.Controller;

{ TItemController }

constructor TItemController.Create;
begin
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

class function TItemController.New: IItemController;
begin
  Result := Self.Create;
end;

end.
