unit Venda.Model;

interface

uses
  Venda.Model.Inerf,
  Cliente.Model.Interf, Item.Model.Interf, Pagamento.Model.Interf;

type
  TVendaModel = class(TInterfacedObject, IVendaModel, IVendaMetodoModel)
  private
    FState: IVendaMetodoModel;
    FCliente: IClienteModel;
    FItens: IItemModel;
    FPagamentos: IPagamentoModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IVendaModel;

    // VendaModel
    function Metodo: IVendaMetodoModel;
    function SetState(Value: IVendaMetodoModel): IVendaMetodoModel;
    function Cliente: IClienteModel; overload;
    function Cliente(Value: IClienteModel): IVendaModel; overload;
    function Itens: IItemModel;
    function Pagamentos: IPagamentoModel;

    // VendaMetodoModel
    function Abrir: IVendaMetodoAbrirModel;
    function Pagar: IVendaMetodoPagarModel;
    function Fechar: IVendaMetodoFecharModel;
    function &End: IVendaModel;
  end;

implementation

uses
  Venda_Metodo_Factory.Model, Venda_State_Factory.Model, PDVUpdates.Model;

{ TVendaModel }

function TVendaModel.Abrir: IVendaMetodoAbrirModel;
begin
  FState.Abrir;
  Result := TVendaMetodoFactoryModel.New.Abrir(Self);
end;

function TVendaModel.&End: IVendaModel;
begin
  Result := Self;
end;

function TVendaModel.Cliente: IClienteModel;
begin
  Result := FCliente;
end;

function TVendaModel.Cliente(Value: IClienteModel): IVendaModel;
begin
  Result := Self;
  FCliente := Value;
end;

constructor TVendaModel.Create;
begin
  FState   := TVendaStateFactoryModel.New.Fechado;
  FCliente := TPDVUpdatesModel.New.Cliente;
  FItens   := TPDVUpdatesModel.New.Item;
  FPagamentos := TPDVUpdatesModel.New.Pagamento;
end;

destructor TVendaModel.Destroy;
begin

  inherited;
end;

function TVendaModel.Fechar: IVendaMetodoFecharModel;
begin
  FState.Fechar;
  Result := TVendaMetodoFactoryModel.New.Fechar(Self);
end;

function TVendaModel.Itens: IItemModel;
begin
  Result := FItens;
end;

function TVendaModel.Metodo: IVendaMetodoModel;
begin
  Result := Self;
end;

class function TVendaModel.New: IVendaModel;
begin
  Result := Self.Create;
end;

function TVendaModel.Pagamentos: IPagamentoModel;
begin
  Result := FPagamentos;
end;

function TVendaModel.Pagar: IVendaMetodoPagarModel;
begin
  FState.Pagar;
  Result := TVendaMetodoFactoryModel.New.Pagar(Self);
end;

function TVendaModel.SetState(Value: IVendaMetodoModel): IVendaMetodoModel;
begin
  Result := Self;
  FState := Value;
end;

end.
