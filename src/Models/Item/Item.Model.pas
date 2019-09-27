unit Item.Model;

interface

uses
  Item.Model.Interf;

type
  TItemModel = class(TInterfacedObject, IItemModel, IItemMetodoModel)
  private
    FState: IItemMetodoModel;
    FIterator: IItemIteratorModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemModel;

    // IItemModel
    function Metodo: IItemMetodoModel;
    function SetState(Value: IItemMetodoModel): IItemModel;
    function Iterator: IItemIteratorModel;

    // IItemMetodoModel
    function Vender: IItemMetodoVenderModel;
    function Cancelar: IItemMetodoCancelarModel;
    function Desconto: IItemMetodoDescontoModel;
    function Acrescimo: IItemMetodoAcrescimoModel;
    function Repetir: IItemMetodoRepetirModel;
    function &End: IItemModel;
  end;

implementation

uses
  Item_Metodo_Factory.Model, Item_State_Factory.Model, Item_Factory.Model;

{ TItemModel }

function TItemModel.Acrescimo: IItemMetodoAcrescimoModel;
begin
  FState.Acrescimo;
  Result := TItemMetodoFactoryModel.New.Acrescimo(Self);
end;

function TItemModel.Cancelar: IItemMetodoCancelarModel;
begin
  FState.Cancelar;
  Result := TItemMetodoFactoryModel.New.Cancelar(Self);
end;

function TItemModel.&End: IItemModel;
begin
  Result := Self;
end;

function TItemModel.Iterator: IItemIteratorModel;
begin
  Result := FIterator;
end;

constructor TItemModel.Create;
begin
  FState    := TItemStateFactoryModel.New.Ativo;
  FIterator := TItemFactoryModel.New.Iterator(Self);
end;

function TItemModel.Desconto: IItemMetodoDescontoModel;
begin
  FState.Desconto;
  Result := TItemMetodoFactoryModel.New.Desconto(Self);
end;

destructor TItemModel.Destroy;
begin

  inherited;
end;

function TItemModel.Metodo: IItemMetodoModel;
begin
  Result := Self;
end;

class function TItemModel.New: IItemModel;
begin
  Result := Self.Create;
end;

function TItemModel.Repetir: IItemMetodoRepetirModel;
begin
  FState.Repetir;
  Result := TItemMetodoFactoryModel.New.Repetir(Self);
end;

function TItemModel.SetState(Value: IItemMetodoModel): IItemModel;
begin
  Result := Self;
  FState := Value;
end;

function TItemModel.Vender: IItemMetodoVenderModel;
begin
  FState.Vender;
  Result := TItemMetodoFactoryModel.New.Vender(Self);
end;

end.
