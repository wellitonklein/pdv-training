unit Pagamento_Tipo_Dinheiro.Model;

interface

uses
  Pagamento.Model.Interf;

type
  TPagamentoTipoDinheiroModel = class(TInterfacedObject, IPagamentoTipoMetodoModel)
  private
    FParent: IPagamentoModel;
  public
    constructor Create(Parent: IPagamentoModel);
    destructor Destroy; override;
    class function New(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
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

constructor TPagamentoTipoDinheiroModel.Create(Parent: IPagamentoModel);
begin
  FParent := Parent;
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
  Result := TPagamentoTipoDinheiroMetodoFactoryModel.New.Executar(Self);
end;

class function TPagamentoTipoDinheiroModel.New(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
begin
  Result := Self.Create(Parent);
end;

end.
