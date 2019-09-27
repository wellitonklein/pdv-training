unit Venda_Metodo_Pagar.Model;

interface

uses
  Venda.Model.Inerf;

type
  TVendaMetodoPagarModel = class(TInterfacedObject, IVendaMetodoPagarModel)
  private
    FParent: IVendaModel;
  public
    constructor Create(Parent: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IVendaModel): IVendaMetodoPagarModel;
    function &End: IVendaMetodoModel;
  end;

implementation

uses
  Venda_State_Factory.Model;

{ TVendaMetodoPagarModel }

function TVendaMetodoPagarModel.&End: IVendaMetodoModel;
begin
  Result := FParent.Metodo;

  FParent.SetState(TVendaStateFactoryModel.New.Pagamento);
end;

constructor TVendaMetodoPagarModel.Create(Parent: IVendaModel);
begin
  FParent := Parent;
end;

destructor TVendaMetodoPagarModel.Destroy;
begin

  inherited;
end;

class function TVendaMetodoPagarModel.New(Parent: IVendaModel): IVendaMetodoPagarModel;
begin
  Result := Self.Create(Parent);
end;

end.
