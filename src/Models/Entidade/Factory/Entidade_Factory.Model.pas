unit Entidade_Factory.Model;

interface

uses
  Entidade.Model.Interf,
  Entidade_Usuario.Model,
  Entidade_Caixa.Model,
  Entidade_CaixaOperacoes.Model,
  Entidade_Venda.Model,
  Entidade_Cliente.Model,
  Entidade_Produto.Model,
  Entidade_VendaItens.Model,
  Entidade_VendaPagamentos.Model;

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
    function Cliente: TCliente;
    function Produto: TPRODUTO;
    function VendaItens: TVENDAITENS;
    function VendaPagamentos: TVENDAPAGAMENTOS;
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

function TEntidadeFactoryModel.Cliente: TCliente;
begin
  Result := TCLIENTE.Create;
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

function TEntidadeFactoryModel.Produto: TPRODUTO;
begin
  Result := TPRODUTO.Create;
end;

function TEntidadeFactoryModel.Usuario: TUsuario;
begin
  Result := TUsuario.Create;
end;

function TEntidadeFactoryModel.Venda: TVenda;
begin
  Result := TVENDA.Create;
end;

function TEntidadeFactoryModel.VendaItens: TVENDAITENS;
begin
  Result := TVENDAITENS.Create;
end;

function TEntidadeFactoryModel.VendaPagamentos: TVENDAPAGAMENTOS;
begin
  Result := TVENDAPAGAMENTOS.Create;
end;

end.
