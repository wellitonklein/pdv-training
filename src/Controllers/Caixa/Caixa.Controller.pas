unit Caixa.Controller;

interface

uses
  Caixa.Controller.Interf;

type
  TCaixaController = class(TInterfacedObject, ICaixaController)
  private
    FMetodo: ICaixaMetodoController;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaController;
    function Metodo: ICaixaMetodoController;
  end;

implementation

uses
  Caixa_Metodo.Controller;

{ TCaixaController }

constructor TCaixaController.Create;
begin
  FMetodo := TCaixaMetodoController.New(Self);
end;

destructor TCaixaController.Destroy;
begin

  inherited;
end;

function TCaixaController.Metodo: ICaixaMetodoController;
begin
  Result := FMetodo;
end;

class function TCaixaController.New: ICaixaController;
begin
  Result := Self.Create;
end;

end.
