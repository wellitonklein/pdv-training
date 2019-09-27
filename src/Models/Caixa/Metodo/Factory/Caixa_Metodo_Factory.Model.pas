unit Caixa_Metodo_Factory.Model;

interface

uses
  Caixa_Metodo_Factory.Model.Interf,
  Caixa.Model.interf;

type
  TCaixaMetodoFactoryModel = class(TInterfacedObject, ICaixaMetodoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaMetodoFactoryModel;
    function Abrir(Parent: ICaixaModel): ICaixaMetodoAbrirModel;
    function Fechar(Parent: ICaixaModel): ICaixaMetodoFecharModel;
    function Suprimento(Parent: ICaixaModel): ICaixaMetodoSuprimentoModel;
    function Sangria(Parent: ICaixaModel): ICaixaMetodoSangriaModel;
    function Bloquear(Parent: ICaixaModel): ICaixaMetodoBloquearModel;
    function Desbloquear(Parent: ICaixaModel): ICaixaMetodoDesbloquearModel;
    function TrocarOperador(Parent: ICaixaModel): ICaixaMetodoTrocarOperadorModel;
  end;

implementation

uses
  Caixa_Metodo_Abrir.Model,
  Caixa_Metodo_Bloquear.Model,
  Caixa_Metodo_Desbloquear.Model,
  Caixa_Metodo_Fechar.Model,
  Caixa_Metodo_Sangria.Model,
  Caixa_Metodo_Suprimento.Model,
  Caixa_Metodo_TrocarOperador.Model;

{ TCaixaMetodoFactoryModel }

function TCaixaMetodoFactoryModel.Abrir(
  Parent: ICaixaModel): ICaixaMetodoAbrirModel;
begin
  Result := TCaixaMetodoAbrirModel.New(Parent);
end;

function TCaixaMetodoFactoryModel.Bloquear(
  Parent: ICaixaModel): ICaixaMetodoBloquearModel;
begin
  Result := TCaixaMetodoBloquearModel.New(Parent);
end;

constructor TCaixaMetodoFactoryModel.Create;
begin

end;

function TCaixaMetodoFactoryModel.Desbloquear(
  Parent: ICaixaModel): ICaixaMetodoDesbloquearModel;
begin
  Result := TCaixaMetodoDesbloquearModel.New(Parent);
end;

destructor TCaixaMetodoFactoryModel.Destroy;
begin

  inherited;
end;

function TCaixaMetodoFactoryModel.Fechar(
  Parent: ICaixaModel): ICaixaMetodoFecharModel;
begin
  Result := TCaixaMetodoFecharModel.New(Parent);
end;

class function TCaixaMetodoFactoryModel.New: ICaixaMetodoFactoryModel;
begin
  Result := Self.Create;
end;

function TCaixaMetodoFactoryModel.Sangria(
  Parent: ICaixaModel): ICaixaMetodoSangriaModel;
begin
  Result := TCaixaMetodoSangriaModel.New(Parent);
end;

function TCaixaMetodoFactoryModel.Suprimento(
  Parent: ICaixaModel): ICaixaMetodoSuprimentoModel;
begin
  Result := TCaixaMetodoSuprimentoModel.New(Parent);
end;

function TCaixaMetodoFactoryModel.TrocarOperador(
  Parent: ICaixaModel): ICaixaMetodoTrocarOperadorModel;
begin
  Result := TCaixaMetodoTrocarOperadorModel.New(Parent);
end;

end.
