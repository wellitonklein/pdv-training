unit Venda_Factory.Model;

interface

uses
  Venda_Factory.Model.Inerf, Venda.Model.Inerf, Caixa.Model.interf;

type
  TVendaFactoryModel = class(TInterfacedObject, IVendaFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IVendaFactoryModel;
    function Venda(Caixa: ICaixaModel): IVendaModel;
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

function TVendaFactoryModel.Venda(Caixa: ICaixaModel): IVendaModel;
begin
  Result := TVendaModel.New(Caixa);
end;

end.
