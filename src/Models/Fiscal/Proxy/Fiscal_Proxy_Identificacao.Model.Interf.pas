unit Fiscal_Proxy_Identificacao.Model.Interf;

interface

uses
  Fiscal_Proxy.Model.Interf;

type
  TFiscalProxyIdentificacaoModel = class(TInterfacedObject, IFiscalProxyIdentificacaoModel)
  private
    FParent: IFiscalProxyModel;
    FNumero: SmallInt;
    FData: TDateTime;
  public
    constructor Create(Parent: IFiscalProxyModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalProxyModel): IFiscalProxyIdentificacaoModel;
    function Numero(Value: SmallInt): IFiscalProxyIdentificacaoModel;
    function Data(Value: TDateTime): IFiscalProxyIdentificacaoModel;
    function &End: IFiscalProxyModel;
  end;

implementation

{ TFiscalProxyIdentificacaoModel }

function TFiscalProxyIdentificacaoModel.&End: IFiscalProxyModel;
begin
  Result := FParent;
end;

constructor TFiscalProxyIdentificacaoModel.Create(Parent: IFiscalProxyModel);
begin
  FParent := Parent;
end;

function TFiscalProxyIdentificacaoModel.Data(
  Value: TDateTime): IFiscalProxyIdentificacaoModel;
begin
  Result := Self;
  FData := Value;
end;

destructor TFiscalProxyIdentificacaoModel.Destroy;
begin

  inherited;
end;

class function TFiscalProxyIdentificacaoModel.New(Parent: IFiscalProxyModel): IFiscalProxyIdentificacaoModel;
begin
  Result := Self.Create(Parent);
end;

function TFiscalProxyIdentificacaoModel.Numero(
  Value: SmallInt): IFiscalProxyIdentificacaoModel;
begin
  Result := Self;
  FNumero := Value;
end;

end.
