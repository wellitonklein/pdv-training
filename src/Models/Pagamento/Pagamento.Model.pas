unit Pagamento.Model;

interface

uses
  Pagamento.Model.Interf;

type
  TPagamentoModel = class(TInterfacedObject, IPagamentoModel, IPagamentoTipoModel)
  private
    FIterator: IPagamentoIteratorModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoModel;

    // IPagamentoModel
    function Tipo: IPagamentoTipoModel;
    function Iterator: IPagamentoIteratorModel;

    // IPagamentoTipoModel
    function Dinheiro: IPagamentoTipoMetodoModel;
    function CartaoCredito: IPagamentoTipoMetodoModel;
  end;

implementation

uses
  Pagamento_Tipo_Factory.Model,
  Pagamento_Factory.Model;

{ TPagamentoModel }

function TPagamentoModel.CartaoCredito: IPagamentoTipoMetodoModel;
begin
  Result := TPagamentoTipoFactoryModel.New.CartaoCredito(Self);
end;

constructor TPagamentoModel.Create;
begin
  FIterator := TPagamentoFactoryModel.New.Iterator(Self);
end;

destructor TPagamentoModel.Destroy;
begin

  inherited;
end;

function TPagamentoModel.Dinheiro: IPagamentoTipoMetodoModel;
begin
  Result := TPagamentoTipoFactoryModel.New.Dinheiro(Self);
end;

function TPagamentoModel.Iterator: IPagamentoIteratorModel;
begin
  Result := FIterator;
end;

class function TPagamentoModel.New: IPagamentoModel;
begin
  Result := Self.Create;
end;

function TPagamentoModel.Tipo: IPagamentoTipoModel;
begin
  Result := Self;
end;

end.
