unit Usuario.Controller;

interface

uses
  Usuario.Controller.Interf,
  Usuario.Model.Interf;

type
  TUsuarioController = class(TInterfacedObject, IUsuarioController)
  private
    FModel: IUsuarioModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IUsuarioController;
    function Model: IUsuarioModel;
    function Caixa: IUsuarioMetodoModel;
    function Fiscal: IUsuarioMetodoModel;
    function Gerente: IUsuarioMetodoModel;
  end;

implementation

uses
  Usuario_Tipo_Factory.Model,
  PDVUpdates_Type.Controller,
  Usuario_Factory.Controller,
  PDVUpdates.Model;

{ TUsuarioController }

function TUsuarioController.Caixa: IUsuarioMetodoModel;
begin
  Result :=
    TPDVUpdatesModel.New.Usuario
      .Metodo(
        TUsuarioTipoFactoryModel.New.UsuarioTipo(FModel, tuCaixa,
          TUsuarioTipoFactoryModel.New.UsuarioTipo(FModel, tuFiscal,
              TUsuarioTipoFactoryModel.New.UsuarioTipo(FModel, tuGerente
            ).SetOperacao(TUsuarioFactoryController.New.Operacoes)
          ).SetOperacao(TUsuarioFactoryController.New.Operacoes)
        ).SetOperacao(TUsuarioFactoryController.New.Operacoes)
      );
end;

constructor TUsuarioController.Create;
begin
  FModel := TPDVUpdatesModel.New.Usuario;
end;

destructor TUsuarioController.Destroy;
begin

  inherited;
end;

function TUsuarioController.Fiscal: IUsuarioMetodoModel;
begin
  Result :=
    TPDVUpdatesModel.New.Usuario
      .Metodo(
        TUsuarioTipoFactoryModel.New.UsuarioTipo(FModel, tuFiscal,
          TUsuarioTipoFactoryModel.New.UsuarioTipo(FModel, tuGerente)
        )
      );
end;

function TUsuarioController.Gerente: IUsuarioMetodoModel;
begin
  Result :=
    TPDVUpdatesModel.New.Usuario
      .Metodo(
        TUsuarioTipoFactoryModel.New.UsuarioTipo(FModel, tuGerente)
      );
end;

function TUsuarioController.Model: IUsuarioModel;
begin
  Result := FModel;
end;

class function TUsuarioController.New: IUsuarioController;
begin
  Result := Self.Create;
end;

end.
