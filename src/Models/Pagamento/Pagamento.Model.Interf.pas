unit Pagamento.Model.Interf;

interface

uses
  Entidade_VendaPagamentos.Model,
  ormbr.container.objectset.interfaces;

type
  IPagamentoModel = interface;
  IPagamentoIteratorModel = interface;
  IPagamentoTipoModel = interface;
  IPagamentoTipoFactoryModel = interface;
  IPagamentoTipoMetodoModel = interface;
  IPagamentoMetodoExecutarModel = interface;
  IPagamentoMetodoEstornarModel = interface;

  IPagamentoModel = interface
    ['{30E5FEE9-B3B0-4FFD-BD6A-0CD552E310B4}']
    function Tipo: IPagamentoTipoModel;
    function Iterator: IPagamentoIteratorModel;
    function Entidade: TVENDAPAGAMENTOS; overload;
    function Entidade(Value: TVENDAPAGAMENTOS): IPagamentoModel; overload;
    function DAO: IContainerObjectSet<TVENDAPAGAMENTOS>;
  end;

  IPagamentoIteratorModel = interface
    ['{74CA8AD4-E813-4EDC-8002-EC06A81F3000}']
    function hasNext: Boolean;
    function Next: IPagamentoModel;
    function Add(Value: IPagamentoModel): IPagamentoIteratorModel;
    function &End: IPagamentoModel;
  end;

  IPagamentoTipoModel = interface
    ['{4E60DEAD-A31F-4A2D-8848-FC0A44054FC9}']
    function Dinheiro: IPagamentoTipoMetodoModel;
    function CartaoCredito: IPagamentoTipoMetodoModel;
  end;

  IPagamentoTipoMetodoModel = interface
    ['{EC81ABA4-BEA4-4DE2-BFE8-B5BB2A5DC804}']
    function Executar: IPagamentoMetodoExecutarModel;
    function Estornar: IPagamentoMetodoEstornarModel;
    function &End: IPagamentoModel;
  end;

  IPagamentoMetodoExecutarModel = interface
    ['{02C4BCC4-CEDF-471A-8D83-DBB52DCFA698}']
    function SetValor(Value: Currency): IPagamentoMetodoExecutarModel;
    function &End: IPagamentoTipoMetodoModel;
  end;

  IPagamentoMetodoEstornarModel = interface
    ['{1405A6B7-8630-4528-8FCF-589332347EAF}']
    function SetIndex(Value: SmallInt): IPagamentoMetodoEstornarModel;
    function &End: IPagamentoTipoMetodoModel;
  end;

  IPagamentoTipoFactoryModel = interface
    ['{F9B50FE5-0A54-4FDF-80A1-2E89AC72A202}']
    function Dinheiro(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
    function CartaoCredito(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
  end;

implementation

end.
