unit Fiscal_NFCe_Componentes.Model;

interface

uses
  // ACBr
  ACBrBase,
  ACBrDFe,
  ACBrNFe,
  ACBrNFeDANFEClass,
  ACBrDANFCeFortesFr,

  Fiscal.Model.Interf,
  Fiscal_Proxy.Model.Interf;

type
  TFiscalNFCeComponentesModel = class(TInterfacedObject, IFiscalComponente)
  private
    FACBrNFe: TACBrNFe;
    FACBrNFeDANFCeFortes: TACBrNFeDANFCeFortes;
    FProxy: IFiscalProxyModel;
    procedure GerarNFCe;
    procedure PreencherIdentificacao;
    procedure PreencherEmitente;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalComponente;
    function Emitir(Proxy: IFiscalProxyModel): IFiscalComponente;
  end;

implementation

uses
  System.SysUtils,
  pcnConversao,
  pcnConversaoNFe;

{ TACBrNFCeComponentesModel }

constructor TFiscalNFCeComponentesModel.Create;
begin
  FACBrNFe := TACBrNFe.Create(nil);
  FACBrNFeDANFCeFortes := TACBrNFeDANFCeFortes.Create(nil);

  FACBrNFe.DANFE := FACBrNFeDANFCeFortes;
end;

destructor TFiscalNFCeComponentesModel.Destroy;
begin
  FreeAndNil(FACBrNFe);
  FreeAndNil(FACBrNFeDANFCeFortes);
  inherited;
end;

function TFiscalNFCeComponentesModel.Emitir(
  Proxy: IFiscalProxyModel): IFiscalComponente;
begin
  Result := Self;
  FProxy := Proxy;
  GerarNFCe;
end;

procedure TFiscalNFCeComponentesModel.GerarNFCe;
begin
  PreencherIdentificacao;
end;

class function TFiscalNFCeComponentesModel.New: IFiscalComponente;
begin
  Result := Self.Create;
end;

procedure TFiscalNFCeComponentesModel.PreencherEmitente;
begin
  FACBrNFe.NotasFiscais.Add.NFe.Emit.CNPJCPF           := FProxy.Emitente.Contribuinte.CPFCNPJ;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.IE                := FProxy.Emitente.Contribuinte.IE;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.xNome             := FProxy.Emitente.Contribuinte.Nome;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.xFant             := FProxy.Emitente.Contribuinte.Fantasia;

  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.fone    := FProxy.Emitente.Contribuinte.TeleFone;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.CEP     := FProxy.Emitente.Endereco.CEP;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.xLgr    := FProxy.Emitente.Endereco.Logradouro;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.nro     := FProxy.Emitente.Endereco.Numero;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.xCpl    := FProxy.Emitente.Endereco.Complemento;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.xBairro := FProxy.Emitente.Endereco.Bairro;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.cMun    := FProxy.Emitente.Endereco.cMunFG;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.xMun    := FProxy.Emitente.Endereco.Cidade;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.EnderEmit.UF      := FProxy.Emitente.Endereco.UF;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.enderEmit.cPais   := 1058;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.enderEmit.xPais   := 'BRASIL';

  FACBrNFe.NotasFiscais.Add.NFe.Emit.IEST              := FProxy.Emitente.Contribuinte.IEST;
  FACBrNFe.NotasFiscais.Add.NFe.Emit.IM                := FProxy.Emitente.Contribuinte.IM; // Preencher no caso de existir serviços na nota
  FACBrNFe.NotasFiscais.Add.NFe.Emit.CNAE              := FProxy.Emitente.Contribuinte.CNAE; // Verifique na cidade do emissor da NFe se é permitido
                                // a inclusão de serviços na NFe
  FACBrNFe.NotasFiscais.Add.NFe.Emit.CRT               := crtSimplesNacional;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
end;

procedure TFiscalNFCeComponentesModel.PreencherIdentificacao;
begin
  FACBrNFe.NotasFiscais.Add.NFe.Ide.cNF       := FProxy.Identificacao.Numero; //Caso não seja preenchido será gerado um número aleatório pelo componente
  FACBrNFe.NotasFiscais.Add.NFe.Ide.natOp     := 'VENDA PRODUCAO DO ESTAB.';
  FACBrNFe.NotasFiscais.Add.NFe.Ide.indPag    := ipVista;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.modelo    := 65;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.serie     := FProxy.Identificacao.Serie;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.nNF       := FProxy.Identificacao.Numero;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.dEmi      := FProxy.Identificacao.Data;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.dSaiEnt   := Date;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.hSaiEnt   := Now;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.tpNF      := tnSaida;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.tpEmis    := TpcnTipoEmissao.teContingencia;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta variável quando for para ambiente de produção
  FACBrNFe.NotasFiscais.Add.NFe.Ide.verProc   := '0.0.0.1'; //Versão do seu sistema
  FACBrNFe.NotasFiscais.Add.NFe.Ide.cUF       := UFtoCUF(FProxy.Emitente.Endereco.UF);
  FACBrNFe.NotasFiscais.Add.NFe.Ide.cMunFG    := FProxy.Emitente.Endereco.cMunFG;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.finNFe    := fnNormal;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.tpImp     := tiNFCe;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.indFinal  := cfConsumidorFinal;
  FACBrNFe.NotasFiscais.Add.NFe.Ide.indPres   := pcPresencial;
end;

end.
