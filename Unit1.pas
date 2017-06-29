unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Timer1: TTimer;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N011: TMenuItem;
    N051: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N51: TMenuItem;
    N101: TMenuItem;
    N151: TMenuItem;
    N301: TMenuItem;
    N601: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);


    procedure BitBtn3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N011Click(Sender: TObject);
    procedure N051Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N151Click(Sender: TObject);
    procedure N301Click(Sender: TObject);
    procedure N601Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  targlog:string;
  spdref:string;
  mi:TMenuItem;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
targlog:=OpenDialog1.FileName;
BitBtn2.Enabled:=true;
if Application.MessageBox('Запустить считывание прямо сейчас?'+#13+
'В противном случае вы сможете сделать это позже'+#13+'с помоью кнопки в нижней панели','Внимание!',MB_YESNO) = 6 then
begin
Timer1.Enabled:=true;
Label1.Font.Color:=clGreen;
Label1.Caption:='Происходит считывание лога'+#13+'с интервалом '+spdref;
end;
end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
if timer1.Enabled
then begin timer1.Enabled:=false; BitBtn2.Hint:='Запустить считывание'; end
else begin timer1.Enabled:=true; BitBtn2.Hint:='Остановить считывание'; end;
end;



procedure TForm1.BitBtn3Click(Sender: TObject);
begin
PopupMenu1.Popup(form1.Left+GroupBox2.Left+BitBtn3.Left+33,form1.Top+GroupBox2.Top+BitBtn3.Top+30);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
PopupMenu2.Popup(form1.Left+GroupBox2.Left+BitBtn4.Left+33,form1.Top+GroupBox2.Top+BitBtn4.Top+30);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
spdref:='1 сек';
mi:=N11;
end;

procedure TForm1.N011Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=100;
mi:=N011;
mi.Enabled:=false;
end;

procedure TForm1.N051Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=500;
mi:=N051;
mi.Enabled:=false;
end;

procedure TForm1.N101Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=10000;
mi:=N101;
mi.Enabled:=false;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=1000;
mi:=N11;
mi.Enabled:=false;
end;

procedure TForm1.N151Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=15000;
mi:=N151;
mi.Enabled:=false;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if ColorDialog1.Execute then memo1.Color:=ColorDialog1.Color;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=2000;
mi:=N21;
mi.Enabled:=false;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if ColorDialog1.Execute then memo1.Font.Color:=ColorDialog1.Color;
end;

procedure TForm1.N301Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=30000;
mi:=N301;
mi.Enabled:=false;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=3000;
mi:=N31;
mi.Enabled:=false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if FontDialog1.Execute then memo1.Font:=FontDialog1.Font;
end;

procedure TForm1.N51Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=5000;
mi:=N51;
mi.Enabled:=false;
end;

procedure TForm1.N601Click(Sender: TObject);
begin
mi.Enabled:=true;
timer1.Interval:=60000;
mi:=N601;
mi.Enabled:=false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
try
memo1.Lines.LoadFromFile(targlog);
//memo1.ScrollBy(0,memo1.Lines.Count*memo1.Font.Size);
//memo1.Repaint;
except
Label1.Font.Color:=clRed;
Label1.Caption:=
'Не удаётся считать данные из'+#13+
'лога-источника Считывание будет'+#13+
'произведено при разблокировке файла!'
end;

end;

end.
