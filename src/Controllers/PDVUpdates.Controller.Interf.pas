unit PDVUpdates.Controller.Interf;

interface

uses
  System.SysUtils, {$IFDEF LINUX} {$ELSE} {$IFDEF FMX} FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF} {$ENDIF}
  System.Classes, MVCBr.Interf, Usuario.Controller.Interf,
  Caixa.Controller.Interf, Item.Controller.Interf, Cliente.Controller.Interf,
  Pagamento.Controller.Interf, Venda.Controller.Interf;

type
  IPDVUpdatesController = interface(IController)
    ['{2E4E7CAB-49F8-4C89-B03C-BE6CF990CB69}']
    function Usuario: IUsuarioController;
    function Caixa: ICaixaController;
    function Item(Venda: IVendaController): IItemController;
    function Cliente: IClienteController;
    function Pagamento: IPagamentoController;
    function Venda(Caixa: ICaixaController): IVendaController;
  end;

Implementation

end.
