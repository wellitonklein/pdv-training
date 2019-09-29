unit Entidade_Factory.Model;

interface

uses
  Entidade.Model.Interf,
  Entidade_Usuario.Model,
  Entidade_Caixa.Model,
  Entidade_CaixaOperacoes.Model,
  Entidade_Venda.Model;

type
  TEntidadeFactoryModel = class(TInterfacedObject, IEntidadeFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IEntidadeFactoryModel;
    function Usuario: TUsuario;
    function Caixa: TCaixa;
    function CaixaOperacoes: TCAIXAOPERACOES;
    function Venda: TVenda;
  end;

implementation

{ TEntidadeFactoryModel }

function TEntidadeFactoryModel.Caixa: TCaixa;
begin
  Result := TCaixa.Create;
end;

function TEntidadeFactoryModel.CaixaOperacoes: TCAIXAOPERACOES;
begin
  Result := TCAIXAOPERACOES.Create;
end;

constructor TEntidadeFactoryModel.Create;
begin

end;

destructor TEntidadeFactoryModel.Destroy;
begin

  inherited;
end;

class function TEntidadeFactoryModel.New: IEntidadeFactoryModel;
begin
  Result := Self.Create;
end;

function TEntidadeFactoryModel.Usuario: TUsuario;
begin
  Result := TUsuario.Create;
end;

function TEntidadeFactoryModel.Venda: TVenda;
begin
  Result := TVENDA.Create;
end;

end.
