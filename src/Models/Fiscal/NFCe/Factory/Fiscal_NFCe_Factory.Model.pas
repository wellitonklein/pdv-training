unit Fiscal_NFCe_Factory.Model;

interface

uses
  Fiscal_NFCe_Factory.Model.Interf, Fiscal.Model.Interf;

type
  TFiscalNFCeFactoryModel = class(TInterfacedObject, IFiscalNFCeFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalNFCeFactoryModel;
    function ACBrNFCe: IFiscalComponente;
  end;

implementation

uses
  Fiscal_NFCe_ACBr.Model;

{ TFiscalNFCeFactoryModel }

function TFiscalNFCeFactoryModel.ACBrNFCe: IFiscalComponente;
begin
  Result := TFiscalNFCeACBrModel.New;
end;

constructor TFiscalNFCeFactoryModel.Create;
begin

end;

destructor TFiscalNFCeFactoryModel.Destroy;
begin

  inherited;
end;

class function TFiscalNFCeFactoryModel.New: IFiscalNFCeFactoryModel;
begin
  Result := Self.Create;
end;

end.
