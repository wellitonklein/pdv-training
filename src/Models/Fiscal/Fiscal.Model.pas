unit Fiscal.Model;

interface

uses
  Fiscal.Model.Interf,
  Fiscal_Proxy.Model.Interf;

type
  TFiscalModel = class(TInterfacedObject, IFiscalModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalModel;
    function Proxy(Value: IFiscalComponente): IFiscalProxyModel;
    function NFCe: IFiscalComponente;
  end;

implementation

uses
  Fiscal_NFCe_Factory.Model, Fiscal_Proxy_Factory.Model;

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

function TFiscalModel.Proxy(Value: IFiscalComponente): IFiscalProxyModel;
begin
  Result := TFiscalProxyFactoryModel.New.Proxy(Value);
end;

end.
