unit Usuario_Senha.Controller.Interf;

interface

uses
  System.SysUtils, {$IFDEF LINUX} {$ELSE} {$IFDEF FMX} FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF} {$ENDIF}
  System.Classes, MVCBr.Interf;

type
  IUsuarioSenhaController = interface;

  IUsuarioSenhaController = interface(IController)
    ['{51DA4996-472B-455E-A2B7-89E05747F41C}']
  end;

Implementation

end.
