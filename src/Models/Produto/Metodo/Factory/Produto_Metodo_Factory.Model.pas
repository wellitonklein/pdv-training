unit Produto_Metodo_Factory.Model;

interface

uses
  Produto_Metodo_Factory.Model.Interf,
  Produto.Model.Interf;

type
  TProdutoMetodoFactoryModel = class(TInterfacedObject, IProdutoMetodoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IProdutoMetodoFactoryModel;
    function Buscar(Parent: IProdutoModel): IProdutoMetodoBuscarModel;
  end;

implementation

uses
  Produto_Metodo_Buscar.Model;

{ TProdutoMetodoFactoryModel }

function TProdutoMetodoFactoryModel.Buscar(
  Parent: IProdutoModel): IProdutoMetodoBuscarModel;
begin
  Result := TProdutoMetodoBuscarModel.New(Parent);
end;

constructor TProdutoMetodoFactoryModel.Create;
begin

end;

destructor TProdutoMetodoFactoryModel.Destroy;
begin

  inherited;
end;

class function TProdutoMetodoFactoryModel.New: IProdutoMetodoFactoryModel;
begin
  Result := Self.Create;
end;

end.
