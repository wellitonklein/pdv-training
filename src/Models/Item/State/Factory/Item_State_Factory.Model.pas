unit Item_State_Factory.Model;

interface

uses
  Item_State_Factory.Model.Interf,
  Item.Model.Interf;

type
  TItemStateFactoryModel = class(TInterfacedObject, IItemStateFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemStateFactoryModel;
    function Ativo: IItemMetodoModel;
    function Inativo: IItemMetodoModel;
    function Vendido: IItemMetodoModel;
  end;

implementation

uses
  Item_State_Ativo.Model,
  Item_State_Inativo.Model,
  Item_State_Vendido.Model;

{ TItemStateFactoryModel }

function TItemStateFactoryModel.Ativo: IItemMetodoModel;
begin
  Result := TItemStateAtivoModel.New;
end;

constructor TItemStateFactoryModel.Create;
begin

end;

destructor TItemStateFactoryModel.Destroy;
begin

  inherited;
end;

function TItemStateFactoryModel.Inativo: IItemMetodoModel;
begin
  Result := TItemStateInativoModel.New;
end;

class function TItemStateFactoryModel.New: IItemStateFactoryModel;
begin
  Result := Self.Create;
end;

function TItemStateFactoryModel.Vendido: IItemMetodoModel;
begin
  Result := TItemStateVendidoModel.New;
end;

end.
