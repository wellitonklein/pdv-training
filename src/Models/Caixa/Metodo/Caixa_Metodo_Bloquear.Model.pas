unit Caixa_Metodo_Bloquear.Model;

interface

uses
  Caixa.Model.interf,
  Usuario.Model.Interf;

type
  TCaixaMetodoBloquearModel = class(TInterfacedObject, ICaixaMetodoBloquearModel)
  private
    FParent: ICaixaModel;
    FAutorizador: IUsuarioModel;
  public
    constructor Create(Parent: ICaixaModel);
    destructor Destroy; override;
    class function New(Parent: ICaixaModel): ICaixaMetodoBloquearModel;
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoBloquearModel;
    function &End: ICaixaMetodoModel;
  end;

implementation

uses
  Caixa_State_Factory.Model,
  Entidade_Caixa.Model,
  PDVUpdates_Type.Controller, System.SysUtils;

{ TCaixaMetodoBloquearModel }

function TCaixaMetodoBloquearModel.&End: ICaixaMetodoModel;
var
  CAIXA: TCAIXA;
begin
  Result := FParent.Metodo;

  if (FAutorizador.Entidade.GUUID <> FParent.Entidade.OPERADOR) then
    raise Exception.Create('Favor entrar com a senha do Operador atual');

  CAIXA := FParent.Entidade;
  FParent.DAO.Modify(CAIXA);
  CAIXA.STATUS := Integer(tcsBloqueado);
  FParent.DAO.Update(CAIXA);
  FParent.SetState(TCaixaStateFactoryModel.New.Bloquado);
end;

constructor TCaixaMetodoBloquearModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
end;

destructor TCaixaMetodoBloquearModel.Destroy;
begin

  inherited;
end;

class function TCaixaMetodoBloquearModel.New(Parent: ICaixaModel): ICaixaMetodoBloquearModel;
begin
  Result := Self.Create(Parent);
end;

function TCaixaMetodoBloquearModel.SetAutorizador(
  Value: IUsuarioModel): ICaixaMetodoBloquearModel;
begin
  Result := Self;
  FAutorizador := Value;
end;

end.
