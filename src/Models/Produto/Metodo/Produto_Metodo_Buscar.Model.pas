unit Produto_Metodo_Buscar.Model;

interface

uses
  Produto.Model.Interf;

type
  TProdutoMetodoBuscarModel = class(TInterfacedObject, IProdutoMetodoBuscarModel)
  private
    FParent: IProdutoModel;
    FCodigo: string;
    FDescricai: string;
  public
    constructor Create(Parent: IProdutoModel);
    destructor Destroy; override;
    class function New(Parent: IProdutoModel): IProdutoMetodoBuscarModel;
    function PorCodigo(Value: string): IProdutoMetodoBuscarModel;
    function PorDescricao(Value: string): IProdutoMetodoBuscarModel;
    function &End: IProdutoMetodoModel;
  end;

implementation

{ TProdutoMetodoBuscarModel }

function TProdutoMetodoBuscarModel.&End: IProdutoMetodoModel;
begin
  Result := FParent.Metodo;
end;

constructor TProdutoMetodoBuscarModel.Create(Parent: IProdutoModel);
begin
  FParent := Parent;
end;

destructor TProdutoMetodoBuscarModel.Destroy;
begin

  inherited;
end;

class function TProdutoMetodoBuscarModel.New(Parent: IProdutoModel): IProdutoMetodoBuscarModel;
begin
  Result := Self.Create(Parent);
end;

function TProdutoMetodoBuscarModel.PorCodigo(
  Value: string): IProdutoMetodoBuscarModel;
begin
  Result := Self;
  FCodigo := Value;
end;

function TProdutoMetodoBuscarModel.PorDescricao(
  Value: string): IProdutoMetodoBuscarModel;
begin
  Result := Self;
  FDescricai := Value;
end;

end.
