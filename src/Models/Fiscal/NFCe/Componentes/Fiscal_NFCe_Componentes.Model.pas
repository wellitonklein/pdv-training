unit Fiscal_NFCe_Componentes.Model;

interface

uses
  // ACBr
  ACBrBase,
  ACBrDFe,
  ACBrNFe,
  ACBrNFeDANFEClass,
  ACBrDANFCeFortesFr,

  Fiscal.Model.Interf,
  Fiscal_Proxy.Model.Interf;

type
  TFiscalNFCeComponentesModel = class(TInterfacedObject, IFiscalComponente)
  private
    FACBrNFe: TACBrNFe;
    FACBrNFeDANFCeFortes: TACBrNFeDANFCeFortes;
    FProxy: IFiscalProxyModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalComponente;
//    function Driver: TACBrNFe;
    function Emitir(Proxy: IFiscalProxyModel): IFiscalComponente;
  end;

implementation

uses
  System.SysUtils;

{ TACBrNFCeComponentesModel }

constructor TFiscalNFCeComponentesModel.Create;
begin
  FACBrNFe := TACBrNFe.Create(nil);
  FACBrNFeDANFCeFortes := TACBrNFeDANFCeFortes.Create(nil);

  FACBrNFe.DANFE := FACBrNFeDANFCeFortes;
end;

destructor TFiscalNFCeComponentesModel.Destroy;
begin
  FreeAndNil(FACBrNFe);
  FreeAndNil(FACBrNFeDANFCeFortes);
  inherited;
end;

//function TFiscalNFCeComponentesModel.Driver: TACBrNFe;
//begin
//  Result := FACBrNFe;
//end;

function TFiscalNFCeComponentesModel.Emitir(
  Proxy: IFiscalProxyModel): IFiscalComponente;
begin
  Result := Self;
  FProxy := Proxy;
end;

class function TFiscalNFCeComponentesModel.New: IFiscalComponente;
begin
  Result := Self.Create;
end;

end.
