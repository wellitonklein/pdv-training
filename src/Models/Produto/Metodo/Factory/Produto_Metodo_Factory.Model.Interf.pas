unit Produto_Metodo_Factory.Model.Interf;

interface

uses
  Produto.Model.Interf;

type

  IProdutoMetodoFactoryModel = interface
    ['{349EA4F1-4226-4FC1-BCD3-CB0E82539DE1}']
    function Buscar(Parent: IProdutoModel): IProdutoMetodoBuscarModel;
  end;

implementation

end.
