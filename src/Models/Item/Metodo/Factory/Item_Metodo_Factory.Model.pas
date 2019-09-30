unit Item_Metodo_Factory.Model;

interface

uses
  Item_Metodo_Factory.Model.Interf, Item.Model.Interf, Venda.Model.Inerf;

type
  TItemMetodoFactoryModel = class(TInterfacedObject, IItemMetodoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemMetodoFactoryModel;
    function Vender(Parent: IItemModel; Venda: IVendaModel): IItemMetodoVenderModel;
    function Cancelar(Parent: IItemModel): IItemMetodoCancelarModel;
    function Desconto(Parent: IItemModel): IItemMetodoDescontoModel;
    function Acrescimo(Parent: IItemModel): IItemMetodoAcrescimoModel;
    function Repetir(Parent: IItemModel): IItemMetodoRepetirModel;
  end;

implementation

uses
  Item_Metodo_Acrescimo.Model,
  Item_Metodo_Cancelar.Model,
  Item_Metodo_Desconto.Model,
  Item_Metodo_Repetir.Model,
  Item_Metodo_Vender.Model;

{ TItemMetodoFactoryModel }

function TItemMetodoFactoryModel.Acrescimo(Parent: IItemModel): IItemMetodoAcrescimoModel;
begin
  Result := TItemMetodoAcrescimoModel.New(Parent);
end;

function TItemMetodoFactoryModel.Cancelar(Parent: IItemModel): IItemMetodoCancelarModel;
begin
  Result := TItemMetodoCancelarModel.New(Parent);
end;

constructor TItemMetodoFactoryModel.Create;
begin

end;

function TItemMetodoFactoryModel.Desconto(Parent: IItemModel): IItemMetodoDescontoModel;
begin
  Result := TItemMetodoDescontoModel.New(Parent);
end;

destructor TItemMetodoFactoryModel.Destroy;
begin

  inherited;
end;

class function TItemMetodoFactoryModel.New: IItemMetodoFactoryModel;
begin
  Result := Self.Create;
end;

function TItemMetodoFactoryModel.Repetir(Parent: IItemModel): IItemMetodoRepetirModel;
begin
  Result := TItemMetodoRepetirModel.New(Parent);
end;

function TItemMetodoFactoryModel.Vender(Parent: IItemModel; Venda: IVendaModel): IItemMetodoVenderModel;
begin
  Result := TItemMetodoVenderModel.New(Parent, Venda);
end;

end.
