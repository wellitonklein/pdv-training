unit PDVUpdates_Type.Controller;

interface

type

  TTypeUsuario = (tuCaixa, tuFiscal, tuGerente);
  TTypePagamento = (tpDinheiro, tpCartaoCredito);
  TTypeCaixaStatus = (tcAberto, tcBloqueado, tcFechado);

  TRecordPagamento = record
    Descricao: string;
    Tipo: TTypePagamento;
  end;

implementation

end.
