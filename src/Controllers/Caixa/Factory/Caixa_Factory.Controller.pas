unit Caixa_Factory.Controller;

interface

uses
  Caixa_Factory.Controller.Interf,
  Caixa.Controller.Interf;

type
  TCaixaFactoryController = class(TInterfacedObject, ICaixaFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaFactoryController;
    function Caixa: ICaixaController;
  end;

implementation

uses
  Caixa.Controller;

{ TCaixaFactoryController }

function TCaixaFactoryController.Caixa: ICaixaController;
begin
  Result := TCaixaController.New;
end;

constructor TCaixaFactoryController.Create;
begin

end;

destructor TCaixaFactoryController.Destroy;
begin

  inherited;
end;

class function TCaixaFactoryController.New: ICaixaFactoryController;
begin
  Result := Self.Create;
end;

end.
