unit Produto.Model.Interf;

interface

uses
  Entidade_Produto.Model,
  ormbr.container.objectset.interfaces;

type
  IProdutoModel = interface;
  IProdutoMetodoModel = interface;
  IProdutoMetodoBuscarModel = interface;

  IProdutoModel = interface
    ['{5A596BC6-F3D0-4D35-8992-FD3EAA7825D7}']
    function Metodo: IProdutoMetodoModel;
    function SetState(Value: IProdutoMetodoModel): IProdutoModel;
    function Entidade: TPRODUTO; overload;
    function Entidade(Value: TPRODUTO): IProdutoModel; overload;
    function DAO: IContainerObjectSet<TPRODUTO>;
  end;

  IProdutoMetodoModel = interface
    ['{1F99A050-0399-4707-AE3B-0B313142827E}']
    function Buscar: IProdutoMetodoBuscarModel;
    function &End: IProdutoModel;
  end;

  IProdutoMetodoBuscarModel = interface
    ['{44FC0998-70B7-4A48-A9D2-5069218C4911}']
    function PorCodigo(Value: string): IProdutoMetodoBuscarModel;
    function PorDescricao(Value: string): IProdutoMetodoBuscarModel;
    function &End: IProdutoMetodoModel;
  end;

implementation

end.
