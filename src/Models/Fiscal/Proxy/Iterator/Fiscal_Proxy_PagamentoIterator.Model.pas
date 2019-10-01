unit Fiscal_Proxy_PagamentoIterator.Model;

interface

uses
  Fiscal_Proxy.Model.Interf,
  System.Generics.Collections;

type
  TFiscalProxyPagamentoIteratorModel = class(TInterfacedObject, IFiscalProxyPagamentoIteratorModel)
  private
    FLista: TList<IFiscalProxyPagamentoModel>;
    FCount: Integer;
  public
    constructor Create(Lista: TList<IFiscalProxyPagamentoModel>);
    destructor Destroy; override;
    class function New(Lista: TList<IFiscalProxyPagamentoModel>): IFiscalProxyPagamentoIteratorModel;
    function hasNext: Boolean;
    function Next: IFiscalProxyPagamentoModel;
  end;

implementation

{ TFiscalProxyPagamentoIteratorModel }

constructor TFiscalProxyPagamentoIteratorModel.Create(Lista: TList<IFiscalProxyPagamentoModel>);
begin
  FLista := Lista;
  FCount := 0;
end;

destructor TFiscalProxyPagamentoIteratorModel.Destroy;
begin

  inherited;
end;

function TFiscalProxyPagamentoIteratorModel.hasNext: Boolean;
begin
  Result := not (FCount = FLista.Count);
end;

class function TFiscalProxyPagamentoIteratorModel.New(Lista: TList<IFiscalProxyPagamentoModel>): IFiscalProxyPagamentoIteratorModel;
begin
  Result := Self.Create(Lista);
end;

function TFiscalProxyPagamentoIteratorModel.Next: IFiscalProxyPagamentoModel;
begin
  Result := FLista.Items[FCount];
  Inc(FCount);
end;

end.
