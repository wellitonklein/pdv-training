unit Venda_Factory.Model;

interface

uses
  Venda_Factory.Model.Inerf, Venda.Model.Inerf;

type
  TVendaFactoryModel = class(TInterfacedObject, IVendaFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IVendaFactoryModel;
    function Venda: IVendaModel;
  end;

implementation

uses
  Venda.Model;

{ TVendaFactoryModel }

constructor TVendaFactoryModel.Create;
begin

end;

destructor TVendaFactoryModel.Destroy;
begin

  inherited;
end;

class function TVendaFactoryModel.New: IVendaFactoryModel;
begin
  Result := Self.Create;
end;

function TVendaFactoryModel.Venda: IVendaModel;
begin
  Result := TVendaModel.New;
end;

end.
