unit PDVUpdates_Type.Controller;

interface

type

  TTypeUsuario = (tuCaixa, tuFiscal, tuGerente);
  TTypePagamento = (tpDinheiro, tpCartaoCredito);
  TTypeCaixaStatus = (tsAberto, tsBloqueado, tsFechado);
  TTypeCaixaOperacao = (toSuprimento, toSangria);

  TRecordPagamento = record
    Descricao: string;
    Tipo: TTypePagamento;
  end;

implementation

end.
