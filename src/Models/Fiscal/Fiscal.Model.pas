unit Fiscal.Model;

interface

uses
  Fiscal.Model.Interf,
  Fiscal_Proxy.Model.Interf;

type
  TFiscalModel = class(TInterfacedObject, IFiscalModel)
  private
    FProxy: IFiscalProxyModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalModel;
    function Proxy(Value: IFiscalComponente): IFiscalProxyModel; overload;
    function Proxy: IFiscalProxyModel; overload;
    function NFCe: IFiscalComponente;
  end;

implementation

uses
  Fiscal_NFCe_Factory.Model,
  Fiscal_Proxy_Factory.Model;

{ TFiscalModel }

constructor TFiscalModel.Create;
begin

end;

destructor TFiscalModel.Destroy;
begin

  inherited;
end;

class function TFiscalModel.New: IFiscalModel;
begin
  Result := Self.Create;
end;

function TFiscalModel.NFCe: IFiscalComponente;
begin
  Result := TFiscalNFCeFactoryModel.New.ACBrNFCe;
end;

function TFiscalModel.Proxy: IFiscalProxyModel;
begin
  Result := FProxy;
end;

function TFiscalModel.Proxy(Value: IFiscalComponente): IFiscalProxyModel;
begin
  FProxy := TFiscalProxyFactoryModel.New.Proxy(Value);
  Result := FProxy;
end;

end.
