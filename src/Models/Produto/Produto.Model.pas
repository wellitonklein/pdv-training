unit Produto.Model;

interface

uses
  Produto.Model.Interf,
  Entidade_Produto.Model,
  ormbr.container.objectset.interfaces,
  Conexao.Model.Interf;

type
  TProdutoModel = class(TInterfacedObject, IProdutoModel, IProdutoMetodoModel)
  private
    FConn: IConexaoModel;
    FState: IProdutoMetodoModel;
    FEntidade: TPRODUTO;
    FDAO: IContainerObjectSet<TPRODUTO>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IProdutoModel;

    // IProdutoModel
    function Metodo: IProdutoMetodoModel;
    function SetState(Value: IProdutoMetodoModel): IProdutoModel;
    function Entidade: TPRODUTO; overload;
    function Entidade(Value: TPRODUTO): IProdutoModel; overload;
    function DAO: IContainerObjectSet<TPRODUTO>;
    function &End: IProdutoModel;

    // IProdutoMetodoModel
    function Buscar: IProdutoMetodoBuscarModel;
  end;

implementation

uses
  PDVUpdates.Model,
  ormbr.container.objectset,
  System.SysUtils,
  Produto_Metodo_Factory.Model;

{ TProdutoModel }

function TProdutoModel.&End: IProdutoModel;
begin
  Result := Self;
end;

function TProdutoModel.Buscar: IProdutoMetodoBuscarModel;
begin
  Result := TProdutoMetodoFactoryModel.New.Buscar(Self);
end;

constructor TProdutoModel.Create;
begin
  FConn     := TPDVUpdatesModel.New.Conexao;
  FEntidade := TPDVUpdatesModel.New.Entidade.Produto;
  FDAO      := TContainerObjectSet<TPRODUTO>.Create(FConn.Connection, 15);
//  FState    := TClienteStateFactoryModel.New.Ativo(Self);
end;

function TProdutoModel.DAO: IContainerObjectSet<TPRODUTO>;
begin
  Result := FDAO;
end;

destructor TProdutoModel.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TProdutoModel.Entidade: TPRODUTO;
begin
  Result := FEntidade;
end;

function TProdutoModel.Entidade(Value: TPRODUTO): IProdutoModel;
begin
  Result := Self;
  FEntidade := Value;
end;

function TProdutoModel.Metodo: IProdutoMetodoModel;
begin
  Result := Self;
end;

class function TProdutoModel.New: IProdutoModel;
begin
  Result := Self.Create;
end;

function TProdutoModel.SetState(Value: IProdutoMetodoModel): IProdutoModel;
begin
  Result := Self;
  FState := Value;
end;

end.
