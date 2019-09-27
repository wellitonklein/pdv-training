unit Item_State_Vendido.Model;

interface

uses
  Item.Model.Interf;

type
  TItemStateVendidoModel = class(TInterfacedObject, IItemMetodoModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemMetodoModel;
    function Vender: IItemMetodoVenderModel;
    function Cancelar: IItemMetodoCancelarModel;
    function Desconto: IItemMetodoDescontoModel;
    function Acrescimo: IItemMetodoAcrescimoModel;
    function Repetir: IItemMetodoRepetirModel;
    function &End: IItemModel;
  end;

implementation

{ TItemStateVendidoModel }

function TItemStateVendidoModel.Acrescimo: IItemMetodoAcrescimoModel;
begin

end;

function TItemStateVendidoModel.Cancelar: IItemMetodoCancelarModel;
begin

end;

function TItemStateVendidoModel.&End: IItemModel;
begin

end;

constructor TItemStateVendidoModel.Create;
begin

end;

function TItemStateVendidoModel.Desconto: IItemMetodoDescontoModel;
begin

end;

destructor TItemStateVendidoModel.Destroy;
begin

  inherited;
end;

class function TItemStateVendidoModel.New: IItemMetodoModel;
begin
  Result := Self.Create;
end;

function TItemStateVendidoModel.Repetir: IItemMetodoRepetirModel;
begin

end;

function TItemStateVendidoModel.Vender: IItemMetodoVenderModel;
begin

end;

end.
