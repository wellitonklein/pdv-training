unit Fiscal_NFCe_ACBr.Model;

interface

uses
  // ACBr
  ACBrBase,
  ACBrDFe,
  ACBrNFe,
  ACBrNFeDANFEClass,
  ACBrDANFCeFortesFr,

  Fiscal.Model.Interf;

type
  TFiscalNFCeACBrModel = class(TInterfacedObject, IFiscalComponente)
  private
    FACBrNFe: TACBrNFe;
    FACBrNFeDANFCeFortes: TACBrNFeDANFCeFortes;
    FProxy: IFiscalProxyModel;

    FTotalNFCe: Currency;
    FTotalICMS: Currency;
    FTotalDesconto: Currency;
    FTotalProduto: Currency;
    procedure GerarNFCe;
    procedure PreencherIdentificacao;
    procedure PreencherEmitente;
    procedure PreencherDestinatario;
    procedure PreencherProdutos;
    procedure ArmazenaTotais;
    procedure PreencherPagamentos;
    procedure PreencherTotais;
    procedure PreencherTransporte;
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

procedure TFiscalNFCeACBrModel.ArmazenaTotais;
begin
  FTotalNFCe := (
    FTotalNFCe + FACBrNFe.NotasFiscais.Add.NFe.Det.Add.Prod.vProd
    - FACBrNFe.NotasFiscais.Add.NFe.Det.Add.Prod.vDesc
  );
  FTotalProduto := (FTotalProduto + FACBrNFe.NotasFiscais.Add.NFe.Det.Add.Prod.vProd);
  FTotalDesconto := (FTotalDesconto + FACBrNFe.NotasFiscais.Add.NFe.Det.Add.Prod.vDesc);
  FTotalICMS := (FTotalICMS + FACBrNFe.NotasFiscais.Add.NFe.Det.Add.Imposto.ICMS.vICMS);
end;

constructor TFiscalNFCeACBrModel.Create;
begin
  FACBrNFe := TACBrNFe.Create(nil);
  FACBrNFeDANFCeFortes := TACBrNFeDANFCeFortes.Create(nil);
  FACBrNFe.DANFE := FACBrNFeDANFCeFortes;

  FTotalNFCe := 0;
end;

destructor TFiscalNFCeACBrModel.Destroy;
begin
  FreeAndNil(FACBrNFe);
  FreeAndNil(FACBrNFeDANFCeFortes);
  inherited;
end;

function TFiscalNFCeACBrModel.Emitir(
  Proxy: IFiscalProxyModel): IFiscalComponente;
const
  Sincrono: Boolean = False;
var
  vNumLote: Integer;
begin
  Result := Self;

  FProxy := Proxy;

  FACBrNFe.NotasFiscais.Clear;
  FACBrNFe.Configuracoes.Geral.ModeloDF := moNFCe;
  FACBrNFe.Configuracoes.Geral.VersaoDF := ve400;

  GerarNFCe;
  FACBrNFe.Enviar(vNumLote, True, Sincrono);
end;

procedure TFiscalNFCeACBrModel.GerarNFCe;
begin
  PreencherIdentificacao;
  PreencherEmitente;
  PreencherDestinatario;
  PreencherProdutos;
  PreencherPagamentos;
  PreencherTotais;
  PreencherTransporte;

  FACBrNFe.NotasFiscais.GerarNFe;
end;

class function TFiscalNFCeACBrModel.New: IFiscalComponente;
begin
  Result := Self.Create;
end;

procedure TFiscalNFCeACBrModel.PreencherDestinatario;
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

procedure TFiscalNFCeACBrModel.PreencherEmitente;
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

procedure TFiscalNFCeACBrModel.PreencherIdentificacao;
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

procedure TFiscalNFCeACBrModel.PreencherPagamentos;
var
  FPagamento: IFiscalProxyPagamentoModel;
  FPagamentoIterator: IFiscalProxyPagamentoIteratorModel;
begin
   FPagamentoIterator := FProxy.Pagamento.Iterator;
   while FPagamentoIterator.hasNext do
   begin
     FPagamento := FPagamentoIterator.Next;
     FACBrNFe.NotasFiscais.Add.NFe.pag.Add.tPag := TpcnFormaPagamento(FPagamento.Tipo);
     FACBrNFe.NotasFiscais.Add.NFe.pag.Add.vPag := FPagamento.Valor;
   end;
end;

procedure TFiscalNFCeACBrModel.PreencherProdutos;
var
  FProduto: IFiscalProxyProdutoModel;
  FProdutoIterator: IFiscalProxyProdutoIteratorModel;
  FCount: SmallInt;
begin
  FCount := 1;
  FProdutoIterator := FProxy.Produto.Iterator;
  while FProdutoIterator.hasNext do
  begin
    FProduto := FProdutoIterator.Next;
    with FACBrNFe.NotasFiscais.Add.NFe.Det.Add do
    begin
      Prod.nItem    := FCount; // Número sequencial, para cada item deve ser incrementado
      Prod.cProd    := FProduto.Codigo;
      Prod.cEAN     := FProduto.cEAN;
      Prod.xProd    := FProduto.Descricao;
      Prod.NCM      := FProduto.NCM; // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
      Prod.EXTIPI   := '';
      Prod.CFOP     := FProduto.CFOP;
      Prod.uCom     := FProduto.UND;
      Prod.qCom     := FProduto.Qtde;
      Prod.vUnCom   := FProduto.vUnit;
      Prod.vProd    := (FProduto.Qtde * FProduto.vUnit);
      Prod.cEANTrib  := FProduto.cEAN;
      Prod.uTrib     := FProduto.UND;
      Prod.qTrib     := FProduto.Qtde;
      Prod.vUnTrib   := FProduto.vUnit;
      Prod.vOutro    := 0;
      Prod.vFrete    := 0;
      Prod.vSeg      := 0;
      Prod.vDesc     := FProduto.Desconto;
      Prod.CEST := FProduto.CEST;
      infAdProd := 'Informacao Adicional do Produto';

      // Imposto
      Imposto.vTotTrib := 0;
      with Imposto.ICMS do
      begin
        CST     := cst00;
        orig    := oeNacional;
        modBC   := dbiValorOperacao;
        vBC     := (FProduto.Qtde * FProduto.vUnit);
        pICMS   := FProduto.Aliquota;
        vICMS   := (((FProduto.Qtde * FProduto.vUnit) * FProduto.Aliquota) / 100);
        modBCST := dbisMargemValorAgregado;
        pMVAST  := 0;
        pRedBCST:= 0;
        vBCST   := 0;
        pICMSST := 0;
        vICMSST := 0;
        pRedBC  := 0;
      end;

      // Armazenando Valores
      ArmazenaTotais;
    end;
    Inc(FCount);
  end;
end;

procedure TFiscalNFCeACBrModel.PreencherTotais;
begin
  with FACBrNFe.NotasFiscais.Add.NFe.Total do
  begin
    ICMSTot.vBC     := FTotalNFCe;
    ICMSTot.vICMS   := FTotalICMS;
    ICMSTot.vBCST   := 0;
    ICMSTot.vST     := 0;
    ICMSTot.vProd   := FTotalProduto;
    ICMSTot.vFrete  := 0;
    ICMSTot.vSeg    := 0;
    ICMSTot.vDesc   := FTotalDesconto;
    ICMSTot.vII     := 0;
    ICMSTot.vIPI    := 0;
    ICMSTot.vPIS    := 0;
    ICMSTot.vCOFINS := 0;
    ICMSTot.vOutro  := 0;
    ICMSTot.vNF     := FTotalNFCe;

    // partilha do icms e fundo de probreza
    ICMSTot.vFCPUFDest   := 0.00;
    ICMSTot.vICMSUFDest  := 0.00;
    ICMSTot.vICMSUFRemet := 0.00;

    ISSQNtot.vServ   := 0;
    ISSQNTot.vBC     := 0;
    ISSQNTot.vISS    := 0;
    ISSQNTot.vPIS    := 0;
    ISSQNTot.vCOFINS := 0;
  end;
end;

procedure TFiscalNFCeACBrModel.PreencherTransporte;
begin
  FACBrNFe.NotasFiscais.Add.NFe.Transp.modFrete := mfSemFrete;
end;

end.
