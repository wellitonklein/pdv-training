unit Fiscal_Factory.Controller;

interface

uses
  Fiscal_Factory.Controller.Interf,
  Fiscal.Controller.Interf;

type
  TFiscalFactoryController = class(TInterfacedObject, IFiscalFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalFactoryController;
    function Fiscal: IFiscalController;
  end;

implementation

uses
  Fiscal.Controller;

{ TFiscalFactoryController }

constructor TFiscalFactoryController.Create;
begin

end;

destructor TFiscalFactoryController.Destroy;
begin

  inherited;
end;

function TFiscalFactoryController.Fiscal: IFiscalController;
begin
  Result := TFiscalController.New;
end;

class function TFiscalFactoryController.New: IFiscalFactoryController;
begin
  Result := Self.Create;
end;

end.
