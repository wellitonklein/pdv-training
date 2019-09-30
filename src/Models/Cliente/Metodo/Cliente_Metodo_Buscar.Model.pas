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

uses
  System.Generics.Collections, Entidade_Cliente.Model, System.SysUtils;

{ TClienteMetodoBuscarModel }

function TClienteMetodoBuscarModel.&End: IClienteMetodoModel;
var
  Lista: TObjectList<TCLIENTE>;
begin
  Result := FParent.Metodo;
  Lista := FParent.DAO.FindWhere('CPF = ' + QuotedStr(FCPF));
  if (Lista.Count <= 0) then
    raise Exception.Create('Cliente não encontrado');
  FParent.Entidade(Lista.Items[0]);
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
