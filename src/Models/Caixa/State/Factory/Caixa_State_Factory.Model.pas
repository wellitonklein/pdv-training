unit Caixa_State_Factory.Model;

interface

uses
  Caixa_State_Factory.Model.Interf,
  Caixa.Model.interf;

type
  TCaixaStateFactoryModel = class(TInterfacedObject, ICaixaStateFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaStateFactoryModel;
    function Aberto: ICaixaMetodoModel;
    function Fechado: ICaixaMetodoModel;
    function Bloquado: ICaixaMetodoModel;
  end;

implementation

uses
  Caixa_State_Aberto.Model,
  Caixa_State_Bloqueado.Model,
  Caixa_State_Fechado.Model;

{ TCaixaStateFactoryModel }

function TCaixaStateFactoryModel.Aberto: ICaixaMetodoModel;
begin
  Result := TCaixaStateAbertoModel.New;
end;

function TCaixaStateFactoryModel.Bloquado: ICaixaMetodoModel;
begin
  Result := TCaixaStateBloqueadoModel.New;
end;

constructor TCaixaStateFactoryModel.Create;
begin

end;

destructor TCaixaStateFactoryModel.Destroy;
begin

  inherited;
end;

function TCaixaStateFactoryModel.Fechado: ICaixaMetodoModel;
begin
  Result := TCaixaStateFechadoModel.New;
end;

class function TCaixaStateFactoryModel.New: ICaixaStateFactoryModel;
begin
  Result := Self.Create;
end;

end.
