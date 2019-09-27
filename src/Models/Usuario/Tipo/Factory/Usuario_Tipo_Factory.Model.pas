unit Usuario_Tipo_Factory.Model;

interface

uses
  Usuario_Tipo_Factory.Model.Interf,
  Usuario.Model.Interf, PDVUpdates_Type.Controller;

type
  TUsuarioTipoFactoryModel = class(TInterfacedObject, IUsuarioTipoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IUsuarioTipoFactoryModel;
    function UsuarioTipo(Parent: IUsuarioModel; Tipo: TTypeUsuario;
      NextResponsibility: IUsuarioMetodoModel = nil): IUsuarioMetodoModel;
  end;

implementation

uses
  Usuario_Tipo_Caixa.Model,
  Usuario_Tipo_Fiscal.Model,
  Usuario_Tipo_Gerente.Model, Usuario_Tipo_Padrao.Model;

{ TUsuarioTipoFactoryModel }

constructor TUsuarioTipoFactoryModel.Create;
begin

end;

destructor TUsuarioTipoFactoryModel.Destroy;
begin

  inherited;
end;

class function TUsuarioTipoFactoryModel.New: IUsuarioTipoFactoryModel;
begin
  Result := Self.Create;
end;

function TUsuarioTipoFactoryModel.UsuarioTipo(Parent: IUsuarioModel;
  Tipo: TTypeUsuario; NextResponsibility: IUsuarioMetodoModel = nil)
  : IUsuarioMetodoModel;
begin
  if not Assigned(NextResponsibility) then
    NextResponsibility := TUsuarioTipoPadraoModel.New(Parent);

  case Tipo of
    tuCaixa:
      Result := TUsuarioTipoCaixaModel.New(Parent, NextResponsibility);
    tuFiscal:
      Result := TUsuarioTipoFiscalModel.New(Parent, NextResponsibility);
    tuGerente:
      Result := TUsuarioTipoGerenteModel.New(Parent, NextResponsibility);
  end;
end;

end.
