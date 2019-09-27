unit Cliente_State_Inativo.Model;

interface

uses
  Cliente.Model.Interf;

type
  TClienteStateInativoModel = class(TInterfacedObject, IClienteMetodoModel)
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

uses
  System.SysUtils;

{ TClienteStateInativoModel }

function TClienteStateInativoModel.&End: IClienteModel;
begin
  Result := FParent;
end;

function TClienteStateInativoModel.Buscar: IClienteMetodoBuscarModel;
begin
  raise Exception.Create('O cliente está inativo');
end;

constructor TClienteStateInativoModel.Create(Parent: IClienteModel);
begin
  FParent := Parent;
end;

destructor TClienteStateInativoModel.Destroy;
begin

  inherited;
end;

class function TClienteStateInativoModel.New(Parent: IClienteModel): IClienteMetodoModel;
begin
  Result := Self.Create(Parent);
end;

function TClienteStateInativoModel.Saldo: IClienteMetodoSaldoModel;
begin
  raise Exception.Create('O cliente está inativo');
end;

end.
