unit Item_Metodo.Controller;

interface

uses
  Item.Controller.Interf,
  Item.Model.Interf;

type
  TItemMetodoController = class(TInterfacedObject, IItemMetodoController)
  private
    FParent: IItemController;
    FModel: IItemModel;
  public
    constructor Create(Parent: IItemController);
    destructor Destroy; override;
    class function New(Parent: IItemController): IItemMetodoController;
    function Vender: IItemMetodoController;
    function Cancelar: IItemMetodoController;
    function Desconto: IItemMetodoController;
    function Acrescimo: IItemMetodoController;
    function Repetir: IItemMetodoController;
    function &End: IItemController;
  end;

implementation

uses
  PDVUpdates.Model, Captura_ValorView;

{ TItemMetodoController }

function TItemMetodoController.Acrescimo: IItemMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Acrescimo
      .SetItem(
        Trunc(TCapturaValorView.New(nil).ExibeForm('Informe o código do Item', 'Confirmar', 'Cancelar'))
      )
      .SetValor(
        TCapturaValorView.New(nil).ExibeForm('Informe o valor de Acrescimo', 'Confirmar', 'Cancelar')
      )
      .SetPercentual(
        TCapturaValorView.New(nil).ExibeForm('Informe o percentual de Acrescimo %', 'Confirmar', 'Cancelar')
      )
    .&End;
end;

function TItemMetodoController.Cancelar: IItemMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Cancelar
      .SetItem(
        Trunc(TCapturaValorView.New(nil).ExibeForm('Informe o código do Item', 'Confirmar', 'Cancelar'))
      )
    .&End;
end;

function TItemMetodoController.&End: IItemController;
begin
  Result := FParent;
end;

constructor TItemMetodoController.Create(Parent: IItemController);
begin
  FParent := Parent;
  FModel  := TPDVUpdatesModel.New.Item;
end;

function TItemMetodoController.Desconto: IItemMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Desconto
      .SetItem(
        Trunc(TCapturaValorView.New(nil).ExibeForm('Informe o código do Item', 'Confirmar', 'Cancelar'))
      )
      .SetValor(
        TCapturaValorView.New(nil).ExibeForm('Informe o valor de Desconto', 'Confirmar', 'Cancelar')
      )
      .SetPercentual(0)
    .&End;
end;

destructor TItemMetodoController.Destroy;
begin

  inherited;
end;

class function TItemMetodoController.New(Parent: IItemController): IItemMetodoController;
begin
  Result := Self.Create(Parent);
end;

function TItemMetodoController.Repetir: IItemMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Repetir
      .SetItem(
        Trunc(TCapturaValorView.New(nil).ExibeForm('Informe o código do Item', 'Confirmar', 'Cancelar'))
      )
    .&End;
end;

function TItemMetodoController.Vender: IItemMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Vender
      .SetItem(
        Trunc(TCapturaValorView.New(nil).ExibeForm('Informe o código do Item', 'Confirmar', 'Cancelar'))
      )
    .&End;
end;

end.
