unit Pagamento_Tipo_Dinheiro.Model;

interface

uses
  Pagamento.Model.Interf, Venda.Model.Inerf;

type
  TPagamentoTipoDinheiroModel = class(TInterfacedObject, IPagamentoTipoMetodoModel)
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
  Pagamento_Tipo_Dinheiro_Metodo_Factory.Model;

{ TPagamentoTipoDinheiroModel }

function TPagamentoTipoDinheiroModel.&End: IPagamentoModel;
begin
  Result := FParent;
end;

constructor TPagamentoTipoDinheiroModel.Create(Parent: IPagamentoModel; Venda: IVendaModel);
begin
  FParent := Parent;
  FVenda  := Venda;
end;

destructor TPagamentoTipoDinheiroModel.Destroy;
begin

  inherited;
end;

function TPagamentoTipoDinheiroModel.Estornar: IPagamentoMetodoEstornarModel;
begin
  Result := TPagamentoTipoDinheiroMetodoFactoryModel.New.Estornar(Self);
end;

function TPagamentoTipoDinheiroModel.Executar: IPagamentoMetodoExecutarModel;
begin
  Result := TPagamentoTipoDinheiroMetodoFactoryModel.New.Executar(Self, FVenda);
end;

class function TPagamentoTipoDinheiroModel.New(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
begin
  Result := Self.Create(Parent, Venda);
end;

end.
