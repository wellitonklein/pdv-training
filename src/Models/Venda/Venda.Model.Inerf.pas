unit Venda.Model.Inerf;

interface

uses
  Cliente.Model.Interf, Item.Model.Interf, Pagamento.Model.Interf,
  Entidade_Venda.Model, ormbr.container.objectset.interfaces,
  Caixa.Model.interf, Fiscal.Model.Interf;

type
  IVendaModel = interface;
  IVendaMetodoModel = interface;
  IVendaMetodoAbrirModel = interface;
  IVendaMetodoPagarModel = interface;
  IVendaMetodoFecharModel = interface;

  IVendaModel = interface
    ['{0BD6FAA7-C17B-4795-B6F4-D39DF786FDA7}']
    function Metodo: IVendaMetodoModel;
    function SetState(Value: IVendaMetodoModel): IVendaMetodoModel;
    function Caixa: ICaixaModel;
    function Cliente: IClienteModel; overload;
    function Cliente(Value: IClienteModel): IVendaModel; overload;
    function Itens: IItemModel;
    function Pagamentos: IPagamentoModel;
    function Entidade: TVENDA; overload;
    function Entidade(Value: TVENDA): IVendaModel; overload;
    function DAO: IContainerObjectSet<TVENDA>;
    function ModalidadeFiscal(Value: IFiscalModel): IVendaModel; overload;
    function ModalidadeFiscal: IFiscalModel; overload;
  end;

  IVendaMetodoModel = interface
    ['{8B170001-185A-4BFE-A6D2-ABD5EC2ACA3D}']
    function Abrir: IVendaMetodoAbrirModel;
    function Pagar: IVendaMetodoPagarModel;
    function Fechar: IVendaMetodoFecharModel;
    function &End: IVendaModel;
  end;

  IVendaMetodoAbrirModel = interface
    ['{F2F39E43-A766-41D1-AB6A-B7932BD96193}']
    function &End: IVendaMetodoModel;
  end;

  IVendaMetodoPagarModel = interface
    ['{F2F39E43-A766-41D1-AB6A-B7932BD96193}']
    function &End: IVendaMetodoModel;
  end;

  IVendaMetodoFecharModel = interface
    ['{F2F39E43-A766-41D1-AB6A-B7932BD96193}']
    function &End: IVendaMetodoModel;
  end;

implementation

end.
