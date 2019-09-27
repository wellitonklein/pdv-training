unit Caixa.Model;

interface

uses
  Caixa.Model.interf;

type
  TCaixaModel = class(TInterfacedObject, ICaixaModel, ICaixaMetodoModel)
  private
    FState: ICaixaMetodoModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaModel;

    // ICaixaModel
    function Metodo: ICaixaMetodoModel;
    function SetState(Value: ICaixaMetodoModel): ICaixaModel;

    // ICaixaMetodoModel
    function Abrir: ICaixaMetodoAbrirModel;
    function Fechar: ICaixaMetodoFecharModel;
    function Suprimento: ICaixaMetodoSuprimentoModel;
    function Sangria: ICaixaMetodoSangriaModel;
    function Bloquear: ICaixaMetodoBloquearModel;
    function Desbloquear: ICaixaMetodoDesbloquearModel;
    function TrocarOperador: ICaixaMetodoTrocarOperadorModel;
    function &End: ICaixaModel;
  end;

implementation

uses
  Caixa_Metodo_Factory.Model, Caixa_State_Factory.Model;

{ TCaixaModel }

function TCaixaModel.Abrir: ICaixaMetodoAbrirModel;
begin
  FState.Abrir;
  Result := TCaixaMetodoFactoryModel.New.Abrir(Self);
end;

function TCaixaModel.Bloquear: ICaixaMetodoBloquearModel;
begin
  FState.Bloquear;
  Result := TCaixaMetodoFactoryModel.New.Bloquear(Self);
end;

function TCaixaModel.&End: ICaixaModel;
begin
  Result := Self;
end;

constructor TCaixaModel.Create;
begin
  FState := TCaixaStateFactoryModel.New.Fechado;
  { TODO -oWelliton -cCaixa : Verificar Estado do último Caixa no Banco }
end;

function TCaixaModel.Desbloquear: ICaixaMetodoDesbloquearModel;
begin
  FState.Desbloquear;
  Result := TCaixaMetodoFactoryModel.New.Desbloquear(Self);
end;

destructor TCaixaModel.Destroy;
begin

  inherited;
end;

function TCaixaModel.Fechar: ICaixaMetodoFecharModel;
begin
  FState.Fechar;
  Result := TCaixaMetodoFactoryModel.New.Fechar(Self);
end;

function TCaixaModel.Metodo: ICaixaMetodoModel;
begin
  Result := Self;
end;

class function TCaixaModel.New: ICaixaModel;
begin
  Result := Self.Create;
end;

function TCaixaModel.Sangria: ICaixaMetodoSangriaModel;
begin
  FState.Sangria;
  Result := TCaixaMetodoFactoryModel.New.Sangria(Self);
end;

function TCaixaModel.SetState(Value: ICaixaMetodoModel): ICaixaModel;
begin
  Result := Self;
  FState := Value;
end;

function TCaixaModel.Suprimento: ICaixaMetodoSuprimentoModel;
begin
  FState.Suprimento;
  Result := TCaixaMetodoFactoryModel.New.Suprimento(Self);
end;

function TCaixaModel.TrocarOperador: ICaixaMetodoTrocarOperadorModel;
begin
  FState.TrocarOperador;
  Result := TCaixaMetodoFactoryModel.New.TrocarOperador(Self);
end;

end.
