unit Cliente_Metodo_Factory.Model;

interface

uses
  Cliente_Metodo_Factory.Model.Interf, Cliente.Model.Interf;

type
  TClienteMetodoFactoryModel = class(TInterfacedObject, IClienteMetodoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IClienteMetodoFactoryModel;
    function Saldo(Parent: IClienteModel): IClienteMetodoSaldoModel;
    function Buscar(Parent: IClienteModel): IClienteMetodoBuscarModel;
  end;

implementation

uses
  Cliente_Metodo_Saldo.Model, Cliente_Metodo_Buscar.Model;

{ TClienteMetodoFactoryModel }

function TClienteMetodoFactoryModel.Buscar(
  Parent: IClienteModel): IClienteMetodoBuscarModel;
begin
  Result := TClienteMetodoBuscarModel.New(Parent);
end;

constructor TClienteMetodoFactoryModel.Create;
begin

end;

destructor TClienteMetodoFactoryModel.Destroy;
begin

  inherited;
end;

class function TClienteMetodoFactoryModel.New: IClienteMetodoFactoryModel;
begin
  Result := Self.Create;
end;

function TClienteMetodoFactoryModel.Saldo(Parent: IClienteModel): IClienteMetodoSaldoModel;
begin
  Result := TClienteMetodoSaldoModel.New(Parent);
end;

end.
