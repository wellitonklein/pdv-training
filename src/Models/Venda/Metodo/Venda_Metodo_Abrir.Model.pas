unit Venda_Metodo_Abrir.Model;

interface

uses
  Venda.Model.Inerf;

type
  TVendaMetodoAbrirModel = class(TInterfacedObject, IVendaMetodoAbrirModel)
  private
    FParent: IVendaModel;
  public
    constructor Create(Parent: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IVendaModel): IVendaMetodoAbrirModel;
    function &End: IVendaMetodoModel;
  end;

implementation

uses
  Venda_State_Factory.Model;

{ TVendaMetodoAbrirModel }

function TVendaMetodoAbrirModel.&End: IVendaMetodoModel;
begin
  Result := FParent.Metodo;

  FParent.SetState(TVendaStateFactoryModel.New.Aberto);
end;

constructor TVendaMetodoAbrirModel.Create(Parent: IVendaModel);
begin
  FParent := Parent;
end;

destructor TVendaMetodoAbrirModel.Destroy;
begin

  inherited;
end;

class function TVendaMetodoAbrirModel.New(Parent: IVendaModel): IVendaMetodoAbrirModel;
begin
  Result := Self.Create(Parent);
end;

end.
