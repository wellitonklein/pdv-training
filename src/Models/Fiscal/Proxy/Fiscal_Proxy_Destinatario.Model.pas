unit Fiscal_Proxy_Destinatario.Model;

interface

uses
  Fiscal_Proxy.Model.Interf;

type
  TFiscalProxyDestinatarioModel = class(TInterfacedObject, IFiscalProxyDestinatarioModel)
  private
    FParent: IFiscalProxyModel;
    FContribuinte: IFiscalProxyContribuinteModel<IFiscalProxyDestinatarioModel>;
    FEndereco: IFiscalProxyEnderecoModel<IFiscalProxyDestinatarioModel>;
  public
    constructor Create(Parent: IFiscalProxyModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalProxyModel): IFiscalProxyDestinatarioModel;
    function Contribuinte: IFiscalProxyContribuinteModel<IFiscalProxyDestinatarioModel>;
    function Endereco: IFiscalProxyEnderecoModel<IFiscalProxyDestinatarioModel>;
    function &End: IFiscalProxyModel;
  end;

implementation

uses
  Fiscal_Proxy_Contribuinte.Model,
  Fiscal_Proxy_Endereco.Model;

{ TFiscalProxyDestinatarioModel }

function TFiscalProxyDestinatarioModel.Contribuinte: IFiscalProxyContribuinteModel<IFiscalProxyDestinatarioModel>;
begin
  Result := FContribuinte;
end;

function TFiscalProxyDestinatarioModel.&End: IFiscalProxyModel;
begin
  Result := FParent;
end;

constructor TFiscalProxyDestinatarioModel.Create(Parent: IFiscalProxyModel);
begin
  FParent := Parent;

  FContribuinte := TFiscalProxyContribuinteModel<IFiscalProxyDestinatarioModel>.New(Self);
  FEndereco := TFiscalProxyEnderecoModel<IFiscalProxyDestinatarioModel>.New(Self);
end;

destructor TFiscalProxyDestinatarioModel.Destroy;
begin

  inherited;
end;

function TFiscalProxyDestinatarioModel.Endereco: IFiscalProxyEnderecoModel<IFiscalProxyDestinatarioModel>;
begin
  Result := FEndereco;
end;

class function TFiscalProxyDestinatarioModel.New(Parent: IFiscalProxyModel): IFiscalProxyDestinatarioModel;
begin
  Result := Self.Create(Parent);
end;

end.
