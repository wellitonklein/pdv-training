unit Item_State_Ativo.Model;

interface

uses
  Item.Model.Interf;

type
  TItemStateAtivoModel = class(TInterfacedObject, IItemMetodoModel)
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

uses
  System.SysUtils;

{ TItemStateAtivoModel }

function TItemStateAtivoModel.Acrescimo: IItemMetodoAcrescimoModel;
begin
  raise Exception.Create('O item não foi vendido');
end;

function TItemStateAtivoModel.Cancelar: IItemMetodoCancelarModel;
begin
  raise Exception.Create('O item não foi vendido');
end;

function TItemStateAtivoModel.&End: IItemModel;
begin

end;

constructor TItemStateAtivoModel.Create;
begin

end;

function TItemStateAtivoModel.Desconto: IItemMetodoDescontoModel;
begin
  raise Exception.Create('O item não foi vendido');
end;

destructor TItemStateAtivoModel.Destroy;
begin

  inherited;
end;

class function TItemStateAtivoModel.New: IItemMetodoModel;
begin
  Result := Self.Create;
end;

function TItemStateAtivoModel.Repetir: IItemMetodoRepetirModel;
begin
  raise Exception.Create('O item não foi vendido');
end;

function TItemStateAtivoModel.Vender: IItemMetodoVenderModel;
begin

end;

end.
