unit Item_Metodo_Acrescimo.Model;

interface

uses
  Item.Model.Interf;

type
  TItemMetodoAcrescimoModel = class(TInterfacedObject, IItemMetodoAcrescimoModel)
  private
    FParent: IItemModel;
    FItem: SmallInt;
    FValor: Currency;
    FPercentual: Currency;
  public
    constructor Create(Parent: IItemModel);
    destructor Destroy; override;
    class function New(Parent: IItemModel): IItemMetodoAcrescimoModel;
    function SetItem(Value: SmallInt): IItemMetodoAcrescimoModel;
    function SetValor(Value: Currency): IItemMetodoAcrescimoModel;
    function SetPercentual(Value: Currency): IItemMetodoAcrescimoModel;
    function &End: IItemMetodoModel;
  end;

implementation

{ TItemMetodoAcrecimoModel }

function TItemMetodoAcrescimoModel.&End: IItemMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cItem : Implementar método de Acréscimo Item }
end;

constructor TItemMetodoAcrescimoModel.Create(Parent: IItemModel);
begin
  FParent := Parent;
end;

destructor TItemMetodoAcrescimoModel.Destroy;
begin

  inherited;
end;

class function TItemMetodoAcrescimoModel.New(Parent: IItemModel): IItemMetodoAcrescimoModel;
begin
  Result := Self.Create(Parent);
end;

function TItemMetodoAcrescimoModel.SetItem(
  Value: SmallInt): IItemMetodoAcrescimoModel;
begin
  Result := Self;
  FItem := Value;
end;

function TItemMetodoAcrescimoModel.SetPercentual(
  Value: Currency): IItemMetodoAcrescimoModel;
begin
  Result := Self;
  FPercentual := Value;
end;

function TItemMetodoAcrescimoModel.SetValor(
  Value: Currency): IItemMetodoAcrescimoModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
