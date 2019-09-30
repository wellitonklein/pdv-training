unit Entidade.Model.Interf;

interface

uses
  Entidade_Usuario.Model,
  Entidade_Caixa.Model,
  Entidade_CaixaOperacoes.Model,
  Entidade_Venda.Model,
  Entidade_Cliente.Model,
  Entidade_Produto.Model,
  Entidade_VendaItens.Model;

type

  IEntidadeFactoryModel = interface
    ['{EF7BE100-7722-404A-9674-D95D9CA1ABC4}']
    function Usuario: TUsuario;
    function Caixa: TCaixa;
    function CaixaOperacoes: TCAIXAOPERACOES;
    function Venda: TVenda;
    function Cliente: TCliente;
    function Produto: TPRODUTO;
    function VendaItens: TVENDAITENS;
  end;

implementation

end.
