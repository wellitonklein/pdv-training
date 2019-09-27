unit Usuario_Factory.Controller;

interface

uses
  Usuario_Factory.Controller.Interf,
  Usuario.Controller.Interf,
  Usuario_Operacoes.Controller.Interf;

type
  TUsuarioFactoryController = class(TInterfacedObject, IUsuarioFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IUsuarioFactoryController;
    function Usuario: IUsuarioController;
    function Operacoes: IUsuarioOperacoesController;
  end;

implementation

uses
  Usuario.Controller, Usuario_Operacoes.Controller;

{ TUsuarioFactoryController }

constructor TUsuarioFactoryController.Create;
begin

end;

destructor TUsuarioFactoryController.Destroy;
begin

  inherited;
end;

class function TUsuarioFactoryController.New: IUsuarioFactoryController;
begin
  Result := Self.Create;
end;

function TUsuarioFactoryController.Operacoes: IUsuarioOperacoesController;
begin
  Result := TUsuarioOperacoesController.New;
end;

function TUsuarioFactoryController.Usuario: IUsuarioController;
begin
  Result := TUsuarioController.New;
end;

end.
