unit PDVUpdates_Type.Controller;

interface

type

  TTypeUsuario = (tuCaixa, tuFiscal, tuGerente);
  TTypePagamento = (tpDinheiro, tpCartaoCredito);

  TRecordPagamento = record
    Descricao: string;
    Tipo: TTypePagamento;
  end;

implementation

end.
