unit Fiscal_Proxy_Emitente.Model;

interface

uses
  Fiscal_Proxy.Model.Interf;

type
  TFiscalProxyEmitenteModel = class(TInterfacedObject, IFiscalProxyEmitenteModel)
  private
    FParent: IFiscalProxyModel;
    FContribuinte: IFiscalProxyContribuinteModel<IFiscalProxyEmitenteModel>;
    FEndereco: IFiscalProxyEnderecoModel<IFiscalProxyEmitenteModel>;
  public
    constructor Create(Parent: IFiscalProxyModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalProxyModel): IFiscalProxyEmitenteModel;
    function Contribuinte: IFiscalProxyContribuinteModel<IFiscalProxyEmitenteModel>;
    function Endereco: IFiscalProxyEnderecoModel<IFiscalProxyEmitenteModel>;
    function &End: IFiscalProxyModel;
  end;

implementation

uses
  Fiscal_Proxy_Contribuinte.Model,
  Fiscal_Proxy_Endereco.Model;

{ TFiscalProxyEmitenteModel }

function TFiscalProxyEmitenteModel.Contribuinte: IFiscalProxyContribuinteModel<IFiscalProxyEmitenteModel>;
begin
  Result := FContribuinte;
end;

function TFiscalProxyEmitenteModel.&End: IFiscalProxyModel;
begin
  Result := FParent;
end;

constructor TFiscalProxyEmitenteModel.Create(Parent: IFiscalProxyModel);
begin
  FParent := Parent;

  FContribuinte := TFiscalProxyContribuinteModel<IFiscalProxyEmitenteModel>.New(Self);
  FEndereco := TFiscalProxyEnderecoModel<IFiscalProxyEmitenteModel>.New(Self);
end;

destructor TFiscalProxyEmitenteModel.Destroy;
begin

  inherited;
end;

function TFiscalProxyEmitenteModel.Endereco: IFiscalProxyEnderecoModel<IFiscalProxyEmitenteModel>;
begin
  Result := FEndereco;
end;

class function TFiscalProxyEmitenteModel.New(Parent: IFiscalProxyModel): IFiscalProxyEmitenteModel;
begin
  Result := Self.Create(Parent);
end;

end.
