unit Empresa_Factory.Model;

interface

uses
  Empresa_Factory.Model.Interf,
  Empresa.Model.Interf;

type
  TEmpresaFactoryModel = class(TInterfacedObject, IEmpresaFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IEmpresaFactoryModel;
    function Empresa: IEmpresaModel;
  end;

implementation

uses
  Empresa.Model;

{ TEmpresaFactoryModel }

constructor TEmpresaFactoryModel.Create;
begin

end;

destructor TEmpresaFactoryModel.Destroy;
begin

  inherited;
end;

function TEmpresaFactoryModel.Empresa: IEmpresaModel;
begin
  Result := TEmpresaModel.New;
end;

class function TEmpresaFactoryModel.New: IEmpresaFactoryModel;
begin
  Result := Self.Create;
end;

end.
