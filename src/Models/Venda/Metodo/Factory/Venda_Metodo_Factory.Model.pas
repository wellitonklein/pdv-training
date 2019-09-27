unit Venda_Metodo_Factory.Model;

interface

uses
  Venda_Metodo_Factory.Model.Inerf,
  Venda.Model.Inerf;

type
  TVendaMetodoFactoryModel = class(TInterfacedObject, IVendaMetodoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IVendaMetodoFactoryModel;
    function Abrir(Parent: IVendaModel): IVendaMetodoAbrirModel;
    function Pagar(Parent: IVendaModel): IVendaMetodoPagarModel;
    function Fechar(Parent: IVendaModel): IVendaMetodoFecharModel;
  end;

implementation

uses
  Venda_Metodo_Abrir.Model,
  Venda_Metodo_Fechar.Model,
  Venda_Metodo_Pagar.Model;

{ TVendaMetodoFactoryModel }

function TVendaMetodoFactoryModel.Abrir(
  Parent: IVendaModel): IVendaMetodoAbrirModel;
begin
  Result := TVendaMetodoAbrirModel.New(Parent);
end;

constructor TVendaMetodoFactoryModel.Create;
begin

end;

destructor TVendaMetodoFactoryModel.Destroy;
begin

  inherited;
end;

function TVendaMetodoFactoryModel.Fechar(
  Parent: IVendaModel): IVendaMetodoFecharModel;
begin
  Result := TVendaMetodoFecharModel.New(Parent);
end;

class function TVendaMetodoFactoryModel.New: IVendaMetodoFactoryModel;
begin
  Result := Self.Create;
end;

function TVendaMetodoFactoryModel.Pagar(
  Parent: IVendaModel): IVendaMetodoPagarModel;
begin
  Result := TVendaMetodoPagarModel.New(Parent);
end;

end.
