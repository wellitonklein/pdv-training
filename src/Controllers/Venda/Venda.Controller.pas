unit Venda.Controller;

interface

uses
  Venda.Controller.Interf, Caixa.Controller.Interf;

type
  TVendaController = class(TInterfacedObject, IVendaController)
  private
    FMetodo: IVendaMetodoController;
    FCaixa: ICaixaController;
  public
    constructor Create(Caixa: ICaixaController);
    destructor Destroy; override;
    class function New(Caixa: ICaixaController): IVendaController;
    function Metodo: IVendaMetodoController;
  end;

implementation

uses
  Venda_Metodo.Controller;

{ TVendaController }

constructor TVendaController.Create(Caixa: ICaixaController);
begin
  FCaixa := Caixa;
  FMetodo := TVendaMetodoController.New(Self, FCaixa);
end;

destructor TVendaController.Destroy;
begin

  inherited;
end;

function TVendaController.Metodo: IVendaMetodoController;
begin
  Result := FMetodo;
end;

class function TVendaController.New(Caixa: ICaixaController): IVendaController;
begin
  Result := Self.Create(Caixa);
end;

end.
