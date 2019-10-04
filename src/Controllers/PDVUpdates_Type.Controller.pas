unit PDVUpdates_Type.Controller;

interface

type

  TTypeUsuario = (tuCaixa, tuFiscal, tuGerente);
  TTypePagamento = (tpDinheiro, tpCheque, tpCartaoCredito, tpCartaoDebito, tpCreditoLoja,
                      tpValeAlimentacao, tpValeRefeicao, tpValePresente, tpValeCombustivel,
                      tpDuplicataMercantil, tpBoletoBancario, tpSemPagamento, tpOutro);
  TTypeCaixaStatus = (tcsAberto, tcsBloqueado, tcsFechado);
  TTypeCaixaOperacao = (toSuprimento, toSangria);
  TTypeVendaStatus = (tvsAberto, tvsFechado, tvsCancelado, tvsDevolvido);

  TRecordPagamento = record
    Descricao: string;
    Tipo: TTypePagamento;
  end;

  TRecordItem = record
    Descricao: string;
    Quantidade: Currency;
    ValorUnitario: Currency;
    ValorTotal: Currency;
  end;

implementation

end.
