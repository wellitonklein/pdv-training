unit Fiscal_Proxy_PagamentoLista.Model;

interface

uses
  Fiscal.Model.Interf,
  System.Generics.Collections;

type
  TFiscalProxyPagamentoListaModel = class(TInterfacedObject, IFiscalProxyPagamentoListaModel)
  private
    FParent: IFiscalProxyModel;
    FLista: TList<IFiscalProxyPagamentoModel>;
  public
    constructor Create(Parent: IFiscalProxyModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalProxyModel): IFiscalProxyPagamentoListaModel;
    function Iterator: IFiscalProxyPagamentoIteratorModel;
    function AddPagamento: IFiscalProxyPagamentoModel;
    function &EndPagamento: IFiscalProxyPagamentoListaModel;
    function &End: IFiscalProxyModel;
  end;

implementation

uses
  System.SysUtils,
  Fiscal_Proxy_Factory.Model;

{ TFiscalProxyPagamentoListaModel }

function TFiscalProxyPagamentoListaModel.AddPagamento: IFiscalProxyPagamentoModel;
begin
  FLista.Add(TFiscalProxyFactoryModel.New.Pagamento(FParent));
  Result := FLista.Items[Pred(FLista.Count)];
end;

function TFiscalProxyPagamentoListaModel.&End: IFiscalProxyModel;
begin
  Result := FParent;
end;

constructor TFiscalProxyPagamentoListaModel.Create(Parent: IFiscalProxyModel);
begin
  FParent := Parent;
  FLista  := TList<IFiscalProxyPagamentoModel>.Create;
end;

destructor TFiscalProxyPagamentoListaModel.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TFiscalProxyPagamentoListaModel.EndPagamento: IFiscalProxyPagamentoListaModel;
begin
  Result := Self;
end;

function TFiscalProxyPagamentoListaModel.Iterator: IFiscalProxyPagamentoIteratorModel;
begin
  Result := TFiscalProxyFactoryModel.New.PagamentoIterator(FLista);
end;

class function TFiscalProxyPagamentoListaModel.New(Parent: IFiscalProxyModel): IFiscalProxyPagamentoListaModel;
begin
  Result := Self.Create(Parent);
end;

end.
