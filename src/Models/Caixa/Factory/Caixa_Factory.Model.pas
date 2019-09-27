unit Caixa_Factory.Model;

interface

uses
  Caixa_Factory.Model.interf,
  Caixa.Model.interf;

type
  TCaixaFactoryModel = class(TInterfacedObject, ICaixaFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaFactoryModel;
    function Caixa: ICaixaModel;
  end;

implementation

uses
  Caixa.Model;

{ TCaixaFactoryModel }

function TCaixaFactoryModel.Caixa: ICaixaModel;
begin
  Result := TCaixaModel.New;
end;

constructor TCaixaFactoryModel.Create;
begin

end;

destructor TCaixaFactoryModel.Destroy;
begin

  inherited;
end;

class function TCaixaFactoryModel.New: ICaixaFactoryModel;
begin
  Result := Self.Create;
end;

end.
