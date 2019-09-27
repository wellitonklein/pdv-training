unit Dialog_Pagamento.Controller.Interf;

interface

uses
  System.SysUtils, {$IFDEF LINUX} {$ELSE} {$IFDEF FMX} FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF} {$ENDIF}
  System.Classes, MVCBr.Interf;

type
  IDialogPagamentoController = interface(IController)
    ['{8E4CF585-E752-4680-B93E-537105D56219}']
  end;

Implementation

end.
