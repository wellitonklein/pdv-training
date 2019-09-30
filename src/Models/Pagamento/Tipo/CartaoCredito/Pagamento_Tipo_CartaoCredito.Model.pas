unit Pagamento_Tipo_CartaoCredito.Model;

interface

uses
  Pagamento.Model.Interf, Venda.Model.Inerf;

type
  TPagamentoTipoCartaoCreditoModel = class(TInterfacedObject, IPagamentoTipoMetodoModel)
  private
    FParent: IPagamentoModel;
    FVenda: IVendaModel;
  public
    constructor Create(Parent: IPagamentoModel; Venda: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
    function Executar: IPagamentoMetodoExecutarModel;
    function Estornar: IPagamentoMetodoEstornarModel;
    function &End: IPagamentoModel;
  end;

implementation

uses
  Pagamento_Tipo_CartaoCredito_Metodo_Factory.Model;

{ TPagamentoTipoCartaoCreditoModel }

function TPagamentoTipoCartaoCreditoModel.&End: IPagamentoModel;
begin
  Result := FParent;
end;

constructor TPagamentoTipoCartaoCreditoModel.Create(Parent: IPagamentoModel; Venda: IVendaModel);
begin
  FParent := Parent;
  FVenda  := Venda;
end;

destructor TPagamentoTipoCartaoCreditoModel.Destroy;
begin

  inherited;
end;

function TPagamentoTipoCartaoCreditoModel.Estornar: IPagamentoMetodoEstornarModel;
begin
  Result := TPagamentoTipoCartaoCreditoMetodoFactoryModel.New.Estornar(Self);
end;

function TPagamentoTipoCartaoCreditoModel.Executar: IPagamentoMetodoExecutarModel;
begin
  Result := TPagamentoTipoCartaoCreditoMetodoFactoryModel.New.Executar(Self, FVenda);
end;

class function TPagamentoTipoCartaoCreditoModel.New(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
begin
  Result := Self.Create(Parent, Venda);
end;

end.
