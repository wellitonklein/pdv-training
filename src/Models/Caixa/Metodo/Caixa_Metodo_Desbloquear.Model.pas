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
  Caixa_State_Factory.Model;

{ TCaixaMetodoDesbloquearModel }

function TCaixaMetodoDesbloquearModel.&End: ICaixaMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cCaixa : Executar o processo de Desbloquear }
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
