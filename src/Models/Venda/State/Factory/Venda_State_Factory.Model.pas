unit Venda_State_Factory.Model;

interface

uses
  Venda_State_Factory.Model.Interf, Venda.Model.Inerf;

type
  TVendaStateFactoryModel = class(TInterfacedObject, IVendaStateFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IVendaStateFactoryModel;
    function Aberto: IVendaMetodoModel;
    function Pagamento: IVendaMetodoModel;
    function Fechado: IVendaMetodoModel;
  end;

implementation

uses
  Venda_State_Aberto.Model,
  Venda_State_Fechado.Model,
  Venda_State_Pagamento.Model;

{ TVendaStateFactoryModel }

function TVendaStateFactoryModel.Aberto: IVendaMetodoModel;
begin
  Result := TVendaStateAbertoModel.New;
end;

constructor TVendaStateFactoryModel.Create;
begin

end;

destructor TVendaStateFactoryModel.Destroy;
begin

  inherited;
end;

function TVendaStateFactoryModel.Fechado: IVendaMetodoModel;
begin
  Result := TVendaStateFechadoModel.New;
end;

class function TVendaStateFactoryModel.New: IVendaStateFactoryModel;
begin
  Result := Self.Create;
end;

function TVendaStateFactoryModel.Pagamento: IVendaMetodoModel;
begin
  Result := TVendaStatePagamentoModel.New;
end;

end.
