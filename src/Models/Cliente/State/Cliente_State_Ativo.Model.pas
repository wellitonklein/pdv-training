unit Cliente_State_Ativo.Model;

interface

uses
  Cliente.Model.Interf;

type
  TClienteStateAtivoModel = class(TInterfacedObject, IClienteMetodoModel)
  private
    FParent: IClienteModel;
  public
    constructor Create(Parent: IClienteModel);
    destructor Destroy; override;
    class function New(Parent: IClienteModel): IClienteMetodoModel;
    function Saldo: IClienteMetodoSaldoModel;
    function Buscar: IClienteMetodoBuscarModel;
    function &End: IClienteModel;
  end;

implementation

{ TClienteStateAtivoModel }

function TClienteStateAtivoModel.&End: IClienteModel;
begin
  Result := FParent;
end;

function TClienteStateAtivoModel.Buscar: IClienteMetodoBuscarModel;
begin

end;

constructor TClienteStateAtivoModel.Create(Parent: IClienteModel);
begin
  FParent := Parent;
end;

destructor TClienteStateAtivoModel.Destroy;
begin

  inherited;
end;

class function TClienteStateAtivoModel.New(Parent: IClienteModel): IClienteMetodoModel;
begin
  Result := Self.Create(Parent);
end;

function TClienteStateAtivoModel.Saldo: IClienteMetodoSaldoModel;
begin

end;

end.
