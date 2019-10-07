unit Caixa.Controller;

interface

uses
  Caixa.Controller.Interf,
  Observer.Controller.Interf;

type
  TCaixaController = class(TInterfacedObject, ICaixaController)
  private
    FMetodo: ICaixaMetodoController;
    FObserverCaixa: ISubjectCaixaController;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaController;
    function Metodo: ICaixaMetodoController;
    function ObserverCaixa: ISubjectCaixaController;
  end;

implementation

uses
  Caixa_Metodo.Controller,
  Observer_Caixa.Controller;

{ TCaixaController }

constructor TCaixaController.Create;
begin
  FObserverCaixa := TObserverCaixaController.New;
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

function TCaixaController.ObserverCaixa: ISubjectCaixaController;
begin
  Result := FObserverCaixa;
end;

end.
