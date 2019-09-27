unit Venda_State_Aberto.Model;

interface

uses
  Venda.Model.Inerf;

type
  TVendaStateAbertoModel = class(TInterfacedObject, IVendaMetodoModel)
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

{ TVendaStateAbertoModel }

function TVendaStateAbertoModel.Abrir: IVendaMetodoAbrirModel;
begin
  raise Exception.Create('Já existe uma venda aberta');
end;

function TVendaStateAbertoModel.&End: IVendaModel;
begin

end;

constructor TVendaStateAbertoModel.Create;
begin

end;

destructor TVendaStateAbertoModel.Destroy;
begin

  inherited;
end;

function TVendaStateAbertoModel.Fechar: IVendaMetodoFecharModel;
begin
  raise Exception.Create('Ainda não foram realizados os pagamentos');
end;

class function TVendaStateAbertoModel.New: IVendaMetodoModel;
begin
  Result := Self.Create;
end;

function TVendaStateAbertoModel.Pagar: IVendaMetodoPagarModel;
begin

end;

end.
