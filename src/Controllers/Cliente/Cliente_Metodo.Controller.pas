unit Cliente_Metodo.Controller;

interface

uses
  Cliente.Controller.Interf,
  Cliente.Model.Interf;

type
  TClienteMetodoController = class(TInterfacedObject, IClienteMetodoController)
  private
    FParent: IClienteController;
    FModel: IClienteModel;
  public
    constructor Create(Parent: IClienteController);
    destructor Destroy; override;
    class function New(Parent: IClienteController): IClienteMetodoController;
    function Saldo: IClienteMetodoController;
    function Buscar: IClienteMetodoController;
    function &End: IClienteController;
  end;

implementation

uses
  PDVUpdates.Model, Captura_ValorView;

{ TClienteMetodoController }

function TClienteMetodoController.&End: IClienteController;
begin
  Result := FParent;
end;

function TClienteMetodoController.Buscar: IClienteMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Buscar
      .PorCPF('')
    .&End;
end;

constructor TClienteMetodoController.Create(Parent: IClienteController);
begin
  FParent := Parent;
  FModel  := TPDVUpdatesModel.New.Cliente;
end;

destructor TClienteMetodoController.Destroy;
begin

  inherited;
end;

class function TClienteMetodoController.New(Parent: IClienteController): IClienteMetodoController;
begin
  Result := Self.Create(Parent);
end;

function TClienteMetodoController.Saldo: IClienteMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Saldo
      .SetSaldo(
        TCapturaValorView.New(nil).ExibeForm('Informe o novo saldo do cliente', 'Confirmar', 'Cancelar')
      )
//      .GetSaldo()
    .&End;
end;

end.
