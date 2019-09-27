unit Cliente_State_Factory.Model;

interface

uses
  Cliente_State_Factory.Model.Interf,
  Cliente.Model.Interf;

type
  TClienteStateFactoryModel = class(TInterfacedObject, IClienteStateFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IClienteStateFactoryModel;
    function Ativo(Parent: IClienteModel): IClienteMetodoModel;
    function Inativo(Parent: IClienteModel): IClienteMetodoModel;
    function Bloqueado(Parent: IClienteModel): IClienteMetodoModel;
  end;

implementation

uses
  Cliente_State_Ativo.Model,
  Cliente_State_Bloqueado.Model,
  Cliente_State_Inativo.Model;

{ TClienteStateFactoryModel }

function TClienteStateFactoryModel.Ativo(Parent: IClienteModel): IClienteMetodoModel;
begin
  Result := TClienteStateAtivoModel.New(Parent);
end;

function TClienteStateFactoryModel.Bloqueado(Parent: IClienteModel): IClienteMetodoModel;
begin
  Result := TClienteStateBloqueadoModel.New(Parent);
end;

constructor TClienteStateFactoryModel.Create;
begin

end;

destructor TClienteStateFactoryModel.Destroy;
begin

  inherited;
end;

function TClienteStateFactoryModel.Inativo(Parent: IClienteModel): IClienteMetodoModel;
begin
  Result := TClienteStateInativoModel.New(Parent);
end;

class function TClienteStateFactoryModel.New: IClienteStateFactoryModel;
begin
  Result := Self.Create;
end;

end.
