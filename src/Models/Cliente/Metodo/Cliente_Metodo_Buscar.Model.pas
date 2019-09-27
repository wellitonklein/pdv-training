unit Cliente_Metodo_Buscar.Model;

interface

uses
  Cliente.Model.Interf;

type
  TClienteMetodoBuscarModel = class(TInterfacedObject, IClienteMetodoBuscarModel)
  private
    FParent: IClienteModel;
    FCPF: string;
  public
    constructor Create(Parent: IClienteModel);
    destructor Destroy; override;
    class function New(Parent: IClienteModel): IClienteMetodoBuscarModel;
    function PorCPF(Value: String): IClienteMetodoBuscarModel;
    function &End: IClienteMetodoModel;
  end;

implementation

{ TClienteMetodoBuscarModel }

function TClienteMetodoBuscarModel.&End: IClienteMetodoModel;
begin
  Result := FParent.Metodo;
end;

constructor TClienteMetodoBuscarModel.Create(Parent: IClienteModel);
begin
  FParent := Parent;
end;

destructor TClienteMetodoBuscarModel.Destroy;
begin

  inherited;
end;

class function TClienteMetodoBuscarModel.New(Parent: IClienteModel): IClienteMetodoBuscarModel;
begin
  Result := Self.Create(Parent);
end;

function TClienteMetodoBuscarModel.PorCPF(
  Value: String): IClienteMetodoBuscarModel;
begin
  Result := Self;
  FCPF := Value;
end;

end.
