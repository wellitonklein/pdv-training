unit PDVUpdates_Type.Controller;

interface

type

  TTypeUsuario = (tuCaixa, tuFiscal, tuGerente);
  TTypePagamento = (tpDinheiro, tpCartaoCredito);
  TTypeCaixaStatus = (tcsAberto, tcsBloqueado, tcsFechado);
  TTypeCaixaOperacao = (toSuprimento, toSangria);
  TTypeVendaStatus = (tvsAberto, tvsFechado, tvsCancelado, tvsDevolvido);

  TRecordPagamento = record
    Descricao: string;
    Tipo: TTypePagamento;
  end;

implementation

end.
