unit PDVUpdates.Model;

interface

uses
  PDVUpdates.Model.Interf,
  Caixa.Model.interf,
  Usuario.Model.Interf,
  Item.Model.Interf,
  Cliente.Model.Interf,
  Pagamento.Model.Interf,
  Venda.Model.Inerf,
  Conexao.Model.Interf, Entidade.Model.Interf;

type
  TPDVUpdatesModel = class(TInterfacedObject, IPDVUpdatesModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPDVUpdatesModel;
    function Conexao: IConexaoModel;
    function Entidade: IEntidadeFactoryModel;
    function Caixa: ICaixaModel;
    function Usuario: IUsuarioModel;
    function Item: IItemModel;
    function Cliente: IClienteModel;
    function Pagamento: IPagamentoModel;
    function Venda(Caixa: ICaixaModel): IVendaModel;
  end;

implementation

uses
  Caixa_Factory.Model,
  Usuario_Factory.Model,
  Item_Factory.Model,
  Cliente_Factory.Model,
  Pagamento_Factory.Model,
  Venda_Factory.Model,
  Conexao_Factory.Model,
  Entidade_Factory.Model;

{ TPDVUpdatesModel }

function TPDVUpdatesModel.Caixa: ICaixaModel;
begin
  Result := TCaixaFactoryModel.New.Caixa;
end;

function TPDVUpdatesModel.Cliente: IClienteModel;
begin
  Result := TClienteFactoryModel.New.Cliente;
end;

function TPDVUpdatesModel.Conexao: IConexaoModel;
begin
  Result := TConexaoFactoryModel.New.Conexao;
end;

constructor TPDVUpdatesModel.Create;
begin

end;

destructor TPDVUpdatesModel.Destroy;
begin

  inherited;
end;

function TPDVUpdatesModel.Entidade: IEntidadeFactoryModel;
begin
  Result := TEntidadeFactoryModel.New;
end;

function TPDVUpdatesModel.Item: IItemModel;
begin
  Result := TItemFactoryModel.New.Item;
end;

class function TPDVUpdatesModel.New: IPDVUpdatesModel;
begin
  Result := Self.Create;
end;

function TPDVUpdatesModel.Pagamento: IPagamentoModel;
begin
  Result := TPagamentoFactoryModel.New.Pagamento;
end;

function TPDVUpdatesModel.Usuario: IUsuarioModel;
begin
  Result := TUsuarioFactoryModel.New.Usuario;
end;

function TPDVUpdatesModel.Venda(Caixa: ICaixaModel): IVendaModel;
begin
  Result := TVendaFactoryModel.New.Venda(Caixa);
end;

end.
