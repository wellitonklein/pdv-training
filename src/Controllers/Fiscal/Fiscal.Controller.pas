unit Fiscal.Controller;

interface

uses
  Fiscal.Controller.Interf,
  Fiscal.Model.Interf;

type
  TFiscalController = class(TInterfacedObject, IFiscalController)
  private
    FModel: IFiscalModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalController;
    function ProxyFiscal: IFiscalModel;
  end;

implementation

uses
  PDVUpdates.Model;

{ TFiscalController }

constructor TFiscalController.Create;
begin
  FModel := TPDVUpdatesModel.New.Fiscal;
end;

destructor TFiscalController.Destroy;
begin

  inherited;
end;

class function TFiscalController.New: IFiscalController;
begin
  Result := Self.Create;
end;

function TFiscalController.ProxyFiscal: IFiscalModel;
begin
  Result :=
    FModel.Proxy(
      TPDVUpdatesModel.New.Fiscal.NFCe
    ).&End;
end;

end.
