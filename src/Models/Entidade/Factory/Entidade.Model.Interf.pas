unit Entidade.Model.Interf;

interface

uses
  Entidade_Usuario.Model,
  Entidade_Caixa.Model,
  Entidade_CaixaOperacoes.Model;

type

  IEntidadeFactoryModel = interface
    ['{EF7BE100-7722-404A-9674-D95D9CA1ABC4}']
    function Usuario: TUsuario;
    function Caixa: TCaixa;
    function CaixaOperacoes: TCAIXAOPERACOES;
  end;

implementation

end.
