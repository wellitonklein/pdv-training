unit Produto_Factory.Model;

interface

uses
  Produto_Factory.Model.Interf,
  Produto.Model.Interf;

type
  TProdutoFactoryModel = class(TInterfacedObject, IProdutoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IProdutoFactoryModel;
    function Produto: IProdutoModel;
  end;

implementation

uses
  Produto.Model;

{ TProdutoFactoryModel }

constructor TProdutoFactoryModel.Create;
begin

end;

destructor TProdutoFactoryModel.Destroy;
begin

  inherited;
end;

class function TProdutoFactoryModel.New: IProdutoFactoryModel;
begin
  Result := Self.Create;
end;

function TProdutoFactoryModel.Produto: IProdutoModel;
begin
  Result := TProdutoModel.New;
end;

end.
