unit Item_State_Inativo.Model;

interface

uses
  Item.Model.Interf;

type
  TItemStateInativoModel = class(TInterfacedObject, IItemMetodoModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemMetodoModel;
    function Vender: IItemMetodoVenderModel;
    function Cancelar: IItemMetodoCancelarModel;
    function Desconto: IItemMetodoDescontoModel;
    function Acrescimo: IItemMetodoAcrescimoModel;
    function Repetir: IItemMetodoRepetirModel;
    function &End: IItemModel;
  end;

implementation

uses
  System.SysUtils;

{ TItemStateInativoModel }

function TItemStateInativoModel.Acrescimo: IItemMetodoAcrescimoModel;
begin
  raise Exception.Create('O item se encontra inativo');
end;

function TItemStateInativoModel.Cancelar: IItemMetodoCancelarModel;
begin
  raise Exception.Create('O item se encontra inativo');
end;

function TItemStateInativoModel.&End: IItemModel;
begin

end;

constructor TItemStateInativoModel.Create;
begin

end;

function TItemStateInativoModel.Desconto: IItemMetodoDescontoModel;
begin
  raise Exception.Create('O item se encontra inativo');
end;

destructor TItemStateInativoModel.Destroy;
begin

  inherited;
end;

class function TItemStateInativoModel.New: IItemMetodoModel;
begin
  Result := Self.Create;
end;

function TItemStateInativoModel.Repetir: IItemMetodoRepetirModel;
begin
  raise Exception.Create('O item se encontra inativo');
end;

function TItemStateInativoModel.Vender: IItemMetodoVenderModel;
begin
  raise Exception.Create('O item se encontra inativo');
end;

end.
