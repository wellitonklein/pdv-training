unit Fiscal_Proxy_ProdutoLista.Model;

interface

uses
  Fiscal_Proxy.Model.Interf,
  System.Generics.Collections;

type
  TFiscalProxyProdutoListaModel = class(TInterfacedObject, IFiscalProxyProdutoListaModel)
  private
    FParent: IFiscalProxyModel;
    FLista: TList<IFiscalProxyProdutoModel>;
  public
    constructor Create(Parent: IFiscalProxyModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalProxyModel): IFiscalProxyProdutoListaModel;
    function Iterator: IFiscalProxyProdutoIteratorModel;
    function AddProduto: IFiscalProxyProdutoModel;
    function &EndProduto: IFiscalProxyProdutoListaModel;
    function &End: IFiscalProxyModel;
  end;

implementation

uses
  System.SysUtils,
  Fiscal_Proxy_Factory.Model;

{ TFiscalProxyProdutoListaModel }

function TFiscalProxyProdutoListaModel.AddProduto: IFiscalProxyProdutoModel;
begin
  FLista.Add(TFiscalProxyFactoryModel.New.Produto(FParent));
  Result := FLista.Items[Pred(FLista.Count)];
end;

function TFiscalProxyProdutoListaModel.&End: IFiscalProxyModel;
begin
  Result := FParent;
end;

constructor TFiscalProxyProdutoListaModel.Create(Parent: IFiscalProxyModel);
begin
  FParent := Parent;
  FLista  := TList<IFiscalProxyProdutoModel>.Create;
end;

destructor TFiscalProxyProdutoListaModel.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TFiscalProxyProdutoListaModel.EndProduto: IFiscalProxyProdutoListaModel;
begin
  Result := Self;
end;

function TFiscalProxyProdutoListaModel.Iterator: IFiscalProxyProdutoIteratorModel;
begin
  Result := TFiscalProxyFactoryModel.New.ProdutoIterator(FLista);
end;

class function TFiscalProxyProdutoListaModel.New(Parent: IFiscalProxyModel): IFiscalProxyProdutoListaModel;
begin
  Result := Self.Create(Parent);
end;

end.
