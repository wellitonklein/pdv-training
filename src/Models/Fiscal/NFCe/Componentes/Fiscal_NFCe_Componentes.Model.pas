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
    procedure PreencherDestinatario;
    procedure PreencherProdutos;
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
  pcnConversaoNFe,
  ACBrNFeNotasFiscais;

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
  PreencherEmitente;
  PreencherDestinatario;
end;

class function TFiscalNFCeComponentesModel.New: IFiscalComponente;
begin
  Result := Self.Create;
end;

procedure TFiscalNFCeComponentesModel.PreencherDestinatario;
begin
  with FACBrNFe.NotasFiscais.Add.NFe.Dest do
  begin
    CNPJCPF           := FProxy.Destinatario.Contribuinte.CPFCNPJ;
    IE                := FProxy.Destinatario.Contribuinte.IE;
    ISUF              := FProxy.Destinatario.Contribuinte.ISUF;
    xNome             := FProxy.Destinatario.Contribuinte.Nome;

    EnderDest.Fone    := FProxy.Destinatario.Contribuinte.TeleFone;
    EnderDest.CEP     := FProxy.Destinatario.Endereco.CEP;
    EnderDest.xLgr    := FProxy.Destinatario.Endereco.Logradouro;
    EnderDest.nro     := FProxy.Destinatario.Endereco.Numero;
    EnderDest.xCpl    := FProxy.Destinatario.Endereco.Complemento;
    EnderDest.xBairro := FProxy.Destinatario.Endereco.Bairro;
    EnderDest.cMun    := FProxy.Destinatario.Endereco.cMunFG;
    EnderDest.xMun    := FProxy.Destinatario.Endereco.Cidade;
    EnderDest.UF      := FProxy.Destinatario.Endereco.UF;
    EnderDest.cPais   := 1058;
    EnderDest.xPais   := 'BRASIL';
  end;
end;

procedure TFiscalNFCeComponentesModel.PreencherEmitente;
begin
  with FACBrNFe.NotasFiscais.Add.NFe.Emit do
  begin
    CNPJCPF           := FProxy.Emitente.Contribuinte.CPFCNPJ;
    IE                := FProxy.Emitente.Contribuinte.IE;
    xNome             := FProxy.Emitente.Contribuinte.Nome;
    xFant             := FProxy.Emitente.Contribuinte.Fantasia;

    EnderEmit.fone    := FProxy.Emitente.Contribuinte.TeleFone;
    EnderEmit.CEP     := FProxy.Emitente.Endereco.CEP;
    EnderEmit.xLgr    := FProxy.Emitente.Endereco.Logradouro;
    EnderEmit.nro     := FProxy.Emitente.Endereco.Numero;
    EnderEmit.xCpl    := FProxy.Emitente.Endereco.Complemento;
    EnderEmit.xBairro := FProxy.Emitente.Endereco.Bairro;
    EnderEmit.cMun    := FProxy.Emitente.Endereco.cMunFG;
    EnderEmit.xMun    := FProxy.Emitente.Endereco.Cidade;
    EnderEmit.UF      := FProxy.Emitente.Endereco.UF;
    enderEmit.cPais   := 1058;
    enderEmit.xPais   := 'BRASIL';

    IEST              := FProxy.Emitente.Contribuinte.IEST;
    IM                := FProxy.Emitente.Contribuinte.IM; // Preencher no caso de existir serviços na nota
    CNAE              := FProxy.Emitente.Contribuinte.CNAE; // Verifique na cidade do emissor da NFe se é permitido // a inclusão de serviços na NFe
    CRT               := crtSimplesNacional;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
  end;
end;

procedure TFiscalNFCeComponentesModel.PreencherIdentificacao;
begin
  with FACBrNFe.NotasFiscais.Add.NFe.Ide do
  begin
    cNF       := FProxy.Identificacao.Numero; //Caso não seja preenchido será gerado um número aleatório pelo componente
    natOp     := 'VENDA PRODUCAO DO ESTAB.';
    indPag    := ipVista;
    modelo    := 65;
    serie     := FProxy.Identificacao.Serie;
    nNF       := FProxy.Identificacao.Numero;
    dEmi      := FProxy.Identificacao.Data;
    dSaiEnt   := Date;
    hSaiEnt   := Now;
    tpNF      := tnSaida;
    tpEmis    := TpcnTipoEmissao.teContingencia;
    tpAmb     := taHomologacao;  //Lembre-se de trocar esta variável quando for para ambiente de produção
    verProc   := '0.0.0.1'; //Versão do seu sistema
    cUF       := UFtoCUF(FProxy.Emitente.Endereco.UF);
    cMunFG    := FProxy.Emitente.Endereco.cMunFG;
    finNFe    := fnNormal;
    tpImp     := tiNFCe;
    indFinal  := cfConsumidorFinal;
    indPres   := pcPresencial;
  end;
end;

procedure TFiscalNFCeComponentesModel.PreencherProdutos;
var
  Produto: IFiscalProxyProdutoModel;
  FCount: SmallInt;
begin
  FCount := 1;
  while FProxy.Produto.IteratorProduto.hasNextProduto do
  begin
    Produto := FProxy.Produto.IteratorProduto.NextProduto;

    with FACBrNFe.NotasFiscais.Add.NFe.Det.Add.Prod do
    begin
      nItem    := FCount; // Número sequencial, para cada item deve ser incrementado
      cProd    := '123456';
      cEAN     := Produto.cEAN;
      xProd    := Produto.Descricao;
      NCM      := Produto.NCM; // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
      EXTIPI   := '';
      CFOP     := '5101';
      uCom     := Produto.UND;
      qCom     := Produto.Qtde;
      vUnCom   := Produto.vUnit;
      vProd    := 100;

      cEANTrib  := Produto.cEAN;
      uTrib     := Produto.UND;
      qTrib     := Produto.Qtde;
      vUnTrib   := 100;

      vOutro    := 0;
      vFrete    := 0;
      vSeg      := 0;
      vDesc     := 0;

      CEST := Produto.CEST;
    end;
    FACBrNFe.NotasFiscais.Add.NFe.Det.Add.infAdProd := 'Informacao Adicional do Produto';

    Inc(FCount);
  end;
end;

end.
