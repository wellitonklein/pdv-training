unit Caixa_Metodo_Desbloquear.Model;

interface

uses
  Caixa.Model.interf,
  Usuario.Model.Interf;

type
  TCaixaMetodoDesbloquearModel = class(TInterfacedObject, ICaixaMetodoDesbloquearModel)
  private
    FParent: ICaixaModel;
    FAutorizador: IUsuarioModel;
  public
    constructor Create(Parent: ICaixaModel);
    destructor Destroy; override;
    class function New(Parent: ICaixaModel): ICaixaMetodoDesbloquearModel;
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoDesbloquearModel;
    function &End: ICaixaMetodoModel;
  end;

implementation

uses
  Caixa_State_Factory.Model,
  Entidade_Caixa.Model,
  PDVUpdates_Type.Controller, System.SysUtils;

{ TCaixaMetodoDesbloquearModel }

function TCaixaMetodoDesbloquearModel.&End: ICaixaMetodoModel;
var
  CAIXA: TCAIXA;
begin
  Result := FParent.Metodo;

  if (FAutorizador.Entidade.GUUID <> FParent.Entidade.OPERADOR) then
    raise Exception.Create('Favor entrar com a senha do Operador atual');

  CAIXA := FParent.Entidade;
  FParent.DAO.Modify(CAIXA);
  CAIXA.STATUS := Integer(tcsAberto);
  FParent.DAO.Update(CAIXA);
  FParent.SetState(TCaixaStateFactoryModel.New.Aberto);
end;

constructor TCaixaMetodoDesbloquearModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
end;

destructor TCaixaMetodoDesbloquearModel.Destroy;
begin

  inherited;
end;

class function TCaixaMetodoDesbloquearModel.New(Parent: ICaixaModel): ICaixaMetodoDesbloquearModel;
begin
  Result := Self.Create(Parent);
end;

function TCaixaMetodoDesbloquearModel.SetAutorizador(
  Value: IUsuarioModel): ICaixaMetodoDesbloquearModel;
begin
  Result := Self;
  FAutorizador := Value;
end;

end.
