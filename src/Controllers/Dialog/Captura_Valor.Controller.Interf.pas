unit Captura_Valor.Controller.Interf;

interface

uses
  System.SysUtils, {$IFDEF LINUX} {$ELSE} {$IFDEF FMX} FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF} {$ENDIF}
  System.Classes, MVCBr.Interf;

type
  ICapturaValorController = interface(IController)
    ['{0577A328-8056-49F7-A55A-629B57949077}']
  end;

Implementation

end.
