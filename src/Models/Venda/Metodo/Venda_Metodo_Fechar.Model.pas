unit Venda_Metodo_Fechar.Model;

interface

uses
  Venda.Model.Inerf;

type
  TVendaMetodoFecharModel = class(TInterfacedObject, IVendaMetodoFecharModel)
  private
    FParent: IVendaModel;
  public
    constructor Create(Parent: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IVendaModel): IVendaMetodoFecharModel;
    function &End: IVendaMetodoModel;
  end;

implementation

uses
  Venda_State_Factory.Model;

{ TVendaMetodoFecharModel }

function TVendaMetodoFecharModel.&End: IVendaMetodoModel;
begin
  Result := FParent.Metodo;

  FParent.SetState(TVendaStateFactoryModel.New.Fechado);
end;

constructor TVendaMetodoFecharModel.Create(Parent: IVendaModel);
begin
  FParent := Parent;
end;

destructor TVendaMetodoFecharModel.Destroy;
begin

  inherited;
end;

class function TVendaMetodoFecharModel.New(Parent: IVendaModel): IVendaMetodoFecharModel;
begin
  Result := Self.Create(Parent);
end;

end.
