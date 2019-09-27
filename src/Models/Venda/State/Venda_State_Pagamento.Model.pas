unit Venda_State_Pagamento.Model;

interface

uses
  Venda.Model.Inerf;

type
  TVendaStatePagamentoModel = class(TInterfacedObject, IVendaMetodoModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IVendaMetodoModel;
    function Abrir: IVendaMetodoAbrirModel;
    function Pagar: IVendaMetodoPagarModel;
    function Fechar: IVendaMetodoFecharModel;
    function &End: IVendaModel;
  end;

implementation

uses
  System.SysUtils;

{ TVendaStatePagamentoModel }

function TVendaStatePagamentoModel.Abrir: IVendaMetodoAbrirModel;
begin
  raise Exception.Create('Já existe uma venda aberta');
end;

function TVendaStatePagamentoModel.&End: IVendaModel;
begin

end;

constructor TVendaStatePagamentoModel.Create;
begin

end;

destructor TVendaStatePagamentoModel.Destroy;
begin

  inherited;
end;

function TVendaStatePagamentoModel.Fechar: IVendaMetodoFecharModel;
begin

end;

class function TVendaStatePagamentoModel.New: IVendaMetodoModel;
begin
  Result := Self.Create;
end;

function TVendaStatePagamentoModel.Pagar: IVendaMetodoPagarModel;
begin
  raise Exception.Create('Já existe uma venda em modo de pagamento');
end;

end.
