unit PDVUpdates.Model.Interf;

interface

uses
  Caixa.Model.interf,
  Usuario.Model.Interf,
  Item.Model.Interf,
  Cliente.Model.Interf,
  Pagamento.Model.Interf,
  Venda.Model.Inerf,
  Conexao.Model.Interf,
  Entidade.Model.Interf,
  Produto.Model.Interf;

type

  IPDVUpdatesModel = interface
    ['{27FDDAB6-CFEC-4673-9BBC-6F16614FFC45}']
    function Conexao: IConexaoModel;
    function Entidade: IEntidadeFactoryModel;
    function Caixa: ICaixaModel;
    function Usuario: IUsuarioModel;
    function Item: IItemModel;
    function Cliente: IClienteModel;
    function Pagamento: IPagamentoModel;
    function Venda(Caixa: ICaixaModel): IVendaModel;
    function Produto: IProdutoModel;
  end;

implementation

end.
