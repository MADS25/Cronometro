program Cronometro;

uses
  Vcl.Forms,
  U_Cronometro in 'U_Cronometro.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
