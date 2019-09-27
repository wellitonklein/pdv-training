unit Venda_State_Fechado.Model;

interface

uses
  Venda.Model.Inerf;

type
  TVendaStateFechadoModel = class(TInterfacedObject, IVendaMetodoModel)
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

{ TVendaStateFechadoModel }

function TVendaStateFechadoModel.Abrir: IVendaMetodoAbrirModel;
begin

end;

function TVendaStateFechadoModel.&End: IVendaModel;
begin

end;

constructor TVendaStateFechadoModel.Create;
begin

end;

destructor TVendaStateFechadoModel.Destroy;
begin

  inherited;
end;

function TVendaStateFechadoModel.Fechar: IVendaMetodoFecharModel;
begin
  raise Exception.Create('Não existe venda aberta');
end;

class function TVendaStateFechadoModel.New: IVendaMetodoModel;
begin
  Result := Self.Create;
end;

function TVendaStateFechadoModel.Pagar: IVendaMetodoPagarModel;
begin
  raise Exception.Create('Não existe venda aberta');
end;

end.
