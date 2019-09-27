unit Caixa_State_Bloqueado.Model;

interface

uses
  Caixa.Model.interf;

type
  TCaixaStateBloqueadoModel = class(TInterfacedObject, ICaixaMetodoModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaMetodoModel;
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
  System.SysUtils;

{ TCaixaStateFechadoModel }

function TCaixaStateBloqueadoModel.Abrir: ICaixaMetodoAbrirModel;
begin
  raise Exception.Create('O Caixa está bloqueado');
end;

function TCaixaStateBloqueadoModel.Bloquear: ICaixaMetodoBloquearModel;
begin
  raise Exception.Create('O Caixa já está bloqueado');
end;

function TCaixaStateBloqueadoModel.&End: ICaixaModel;
begin

end;

constructor TCaixaStateBloqueadoModel.Create;
begin

end;

function TCaixaStateBloqueadoModel.Desbloquear: ICaixaMetodoDesbloquearModel;
begin

end;

destructor TCaixaStateBloqueadoModel.Destroy;
begin

  inherited;
end;

function TCaixaStateBloqueadoModel.Fechar: ICaixaMetodoFecharModel;
begin
  raise Exception.Create('O Caixa está bloqueado');
end;

class function TCaixaStateBloqueadoModel.New: ICaixaMetodoModel;
begin
  Result := Self.Create;
end;

function TCaixaStateBloqueadoModel.Sangria: ICaixaMetodoSangriaModel;
begin
  raise Exception.Create('O Caixa está bloqueado');
end;

function TCaixaStateBloqueadoModel.Suprimento: ICaixaMetodoSuprimentoModel;
begin
  raise Exception.Create('O Caixa está bloqueado');
end;

function TCaixaStateBloqueadoModel.TrocarOperador: ICaixaMetodoTrocarOperadorModel;
begin
  raise Exception.Create('O Caixa está bloqueado');
end;

end.
