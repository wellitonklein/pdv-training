unit Pagamento_Tipo_Dinheiro_Metodo_Factory.Model;

interface

uses
  Pagamento_Tipo_Dinheiro_Metodo_Factory.Model.Interf, Pagamento.Model.Interf,
  Venda.Model.Inerf;

type
  TPagamentoTipoDinheiroMetodoFactoryModel = class(TInterfacedObject, IPagamentoTipoDinheiroMetodoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoTipoDinheiroMetodoFactoryModel;
    function Executar(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel): IPagamentoMetodoExecutarModel;
    function Estornar(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
  end;

implementation

uses
  Pagamento_Tipo_Dinheiro_Metodo_Executar.Model,
  Pagamento_Tipo_Dinheiro_Metodo_Estornar.Model;

{ TPagamentoTipoDinheiroMetodoFactoryModel }

constructor TPagamentoTipoDinheiroMetodoFactoryModel.Create;
begin

end;

destructor TPagamentoTipoDinheiroMetodoFactoryModel.Destroy;
begin

  inherited;
end;

function TPagamentoTipoDinheiroMetodoFactoryModel.Estornar(
  Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
begin
  Result := TPagamentoTipoDinheiroMetodoEstornarModel.New(Parent);
end;

function TPagamentoTipoDinheiroMetodoFactoryModel.Executar(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel): IPagamentoMetodoExecutarModel;
begin
  Result := TPagamentoTipoDinheiroMetodoExecutarModel.New(Parent, Venda);
end;

class function TPagamentoTipoDinheiroMetodoFactoryModel.New: IPagamentoTipoDinheiroMetodoFactoryModel;
begin
  Result := Self.Create;
end;

end.
