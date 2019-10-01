unit Fiscal_Proxy_ProdutoIterator.Model;

interface

uses
  Fiscal_Proxy.Model.Interf,
  System.Generics.Collections;

type
  TFiscalProxyProdutoIteratorModel = class(TInterfacedObject, IFiscalProxyProdutoIteratorModel)
  private
    FLista: TList<IFiscalProxyProdutoModel>;
    FCount: Integer;
  public
    constructor Create(Lista: TList<IFiscalProxyProdutoModel>);
    destructor Destroy; override;
    class function New(Lista: TList<IFiscalProxyProdutoModel>): IFiscalProxyProdutoIteratorModel;
    function hasNext: Boolean;
    function Next: IFiscalProxyProdutoModel;
  end;

implementation

{ TFiscalProxyProdutoIteratorModel }

constructor TFiscalProxyProdutoIteratorModel.Create(Lista: TList<IFiscalProxyProdutoModel>);
begin
  FLista := Lista;
  FCount := 0;
end;

destructor TFiscalProxyProdutoIteratorModel.Destroy;
begin

  inherited;
end;

function TFiscalProxyProdutoIteratorModel.hasNext: Boolean;
begin
  Result := not (FCount = FLista.Count);
end;

class function TFiscalProxyProdutoIteratorModel.New(Lista: TList<IFiscalProxyProdutoModel>): IFiscalProxyProdutoIteratorModel;
begin
  Result := Self.Create(Lista);
end;

function TFiscalProxyProdutoIteratorModel.Next: IFiscalProxyProdutoModel;
begin
  Result := FLista.Items[FCount];
  Inc(FCount);
end;

end.
