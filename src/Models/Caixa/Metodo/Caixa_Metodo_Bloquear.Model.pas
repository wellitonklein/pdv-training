unit Caixa_Metodo_Bloquear.Model;

interface

uses
  Caixa.Model.interf, Usuario.Model.Interf;

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
  Caixa_State_Factory.Model;

{ TCaixaMetodoBloquearModel }

function TCaixaMetodoBloquearModel.&End: ICaixaMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cCaixa : Executar o processo de Bloquear }
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
