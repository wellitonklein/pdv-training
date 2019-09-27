unit PDVUpdates_Type.Controller;

interface

type

  TTypeUsuario = (tuCaixa, tuFiscal, tuGerente);
  TTypePagamento = (tpDinheiro, tpCartaoCredito);

  TRecordSenha = record
    Nome: string;
    Senha: string;
  end;

  TRecordPagamento = record
    Descricao: string;
    Tipo: TTypePagamento;
  end;

implementation

end.
