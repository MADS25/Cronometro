unit U_Cronometro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.MPlayer, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TForm2 = class(TForm)
    t_tempo: TTimer;
    lbl_segundos: TLabel;
    lbl_pontos: TLabel;
    lbl_minutos: TLabel;
    MediaPlayer1: TMediaPlayer;
    btn_play: TSpeedButton;
    btn_abrir: TButton;
    dlgOpen1: TOpenDialog;
    txt_tempo: TEdit;
    procedure t_tempoTimer(Sender: TObject);
    procedure btn_playClick(Sender: TObject);
    procedure btn_abrirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn_abrirClick(Sender: TObject);
begin
  if dlgOpen1.Execute then
    begin
      MediaPlayer1.FileName :=  dlgOpen1.FileName;
      btn_play.Enabled := True;
    end;

end;

procedure TForm2.btn_playClick(Sender: TObject);
begin
    t_tempo.Enabled := True;
end;

procedure TForm2.t_tempoTimer(Sender: TObject);
 var seg,min,cont :Integer;
begin

  seg := StrToInt(lbl_segundos.Caption);
  min := StrToInt(lbl_minutos.Caption);

      cont := seg+1;

  lbl_segundos.Caption := IntToStr(cont);

  if lbl_segundos.Caption = '60'  then
    begin
      {seg := 0;
      min := min + 1;
      lbl_minutos.Caption := IntToStr(min);
      lbl_segundos.Caption := IntToStr(cont); }

      lbl_segundos.Caption := '0';
      lbl_minutos.Caption := IntToStr(StrToInt(lbl_minutos.Caption) + 1);
    end;

   if lbl_segundos.Caption = txt_tempo.Text then
    begin
      t_tempo.Enabled := False;
      MediaPlayer1.Open;
      MediaPlayer1.Play;
      btn_play.Enabled := False;
      lbl_segundos.Caption := '0';
      lbl_minutos.Caption := '0';
      txt_tempo.Text := '';
    end;
end;

end.
