unit Produto_Factory.Model.Interf;

interface

uses
  Produto.Model.Interf;

type

  IProdutoFactoryModel = interface
    ['{13C4071E-C3EF-482F-A50D-0D8ADD93F7B8}']
    function Produto: IProdutoModel;
  end;

implementation

end.
