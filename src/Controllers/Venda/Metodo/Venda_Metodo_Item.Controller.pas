unit Venda_Metodo_Item.Controller;

interface

uses
  Venda.Controller.Interf;

type
  TVendaMetodoItemController = class(TInterfacedObject, IVendaMetodoItemController)
  private
    FParent: IVendaController;
    FCodigo: SmallInt;
    FQuantidade: Currency;
    FDesconto: Currency;
  public
    constructor Create(Parent: IVendaController);
    destructor Destroy; override;
    class function New(Parent: IVendaController): IVendaMetodoItemController;
    function Codigo(Value: SmallInt): IVendaMetodoItemController;
    function Quantidade(Value: Currency): IVendaMetodoItemController;
    function Desconto(Value: Currency): IVendaMetodoItemController;
    function Executar: IVendaMetodoItemController;
    function &End: IVendaMetodoController;
  end;

implementation

uses
  PDVUpdates.Model;

{ TVendaMetodoItemController }

function TVendaMetodoItemController.Codigo(Value: SmallInt): IVendaMetodoItemController;
begin
  Result := Self;
  FCodigo := Value;
end;

function TVendaMetodoItemController.&End: IVendaMetodoController;
begin
  Result := FParent.Metodo;
end;

constructor TVendaMetodoItemController.Create(Parent: IVendaController);
begin
  FParent := Parent;
end;

function TVendaMetodoItemController.Desconto(
  Value: Currency): IVendaMetodoItemController;
begin
  Result := Self;
  FDesconto := Value;
end;

destructor TVendaMetodoItemController.Destroy;
begin

  inherited;
end;

function TVendaMetodoItemController.Executar: IVendaMetodoItemController;
begin
  Result := Self;

  FParent.Model.Itens
    .Iterator
      .Add(
        TPDVUpdatesModel.New.Item(FParent.Model)
          .Metodo
            .Vender
              .SetItem(FCodigo)
              .SetQuantidade(FQuantidade)
            .&End
          .&End
      )
    .&End;
end;

class function TVendaMetodoItemController.New(Parent: IVendaController): IVendaMetodoItemController;
begin
  Result := Self.Create(Parent);
end;

function TVendaMetodoItemController.Quantidade(
  Value: Currency): IVendaMetodoItemController;
begin
  Result := Self;
  FQuantidade := Value;
end;

end.
