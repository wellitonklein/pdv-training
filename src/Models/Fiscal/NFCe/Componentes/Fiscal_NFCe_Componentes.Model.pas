unit Fiscal_NFCe_Componentes.Model;

interface

uses
  // ACBr
  ACBrBase,
  ACBrDFe,
  ACBrNFe,
  ACBrNFeDANFEClass,
  ACBrDANFCeFortesFr,

  Fiscal_NFCe_Componentes.Model.Interf;

type
  TFiscalNFCeComponentesModel = class(TInterfacedObject, IFiscalNFCeComponenteModel<TACBrNFe>)
  private
    FACBrNFe: TACBrNFe;
    FACBrNFeDANFCeFortes: TACBrNFeDANFCeFortes;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalNFCeComponenteModel<TACBrNFe>;
    function Driver: TACBrNFe;
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

function TFiscalNFCeComponentesModel.Driver: TACBrNFe;
begin
  Result := FACBrNFe;
end;

class function TFiscalNFCeComponentesModel.New: IFiscalNFCeComponenteModel<TACBrNFe>;
begin
  Result := Self.Create;
end;

end.
