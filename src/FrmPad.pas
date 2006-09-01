unit FrmPad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPadForm = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PadForm: TPadForm;

implementation

{$R *.dfm}

procedure TPadForm.Button1Click(Sender: TObject);
Var I : Integer;
begin
 For I := 0 To Memo1.Lines.Count-1 Do Begin
    Memo1.Lines[I] := Edit1.Text + Memo1.Lines[I] + Edit2.Text;
    Memo1.SelectAll;
    Memo1.CopyToClipboard;
 End;
end;

procedure TPadForm.Button2Click(Sender: TObject);
Var I : Integer;
begin
 For I := 0 To Memo1.Lines.Count-1 Do Begin
   Memo1.Lines[I] := Copy(Memo1.Lines[I],4,65535);
   Memo1.Lines[I] := Copy(Memo1.Lines[I],1,Length(Memo1.Lines[I])-2);
 End;
end;

procedure TPadForm.Button3Click(Sender: TObject);
Var I : Integer;
begin
 For I := 0 To Memo1.Lines.Count-1 Do Begin
   Memo1.Lines[I] := Trim(Memo1.Lines[I]);
 End;
End;

procedure TPadForm.Button4Click(Sender: TObject);
Var I : Integer;
  s : String;
begin
 S := '';
 For I := 1 To Length(Memo1.Text) Do Begin
    If Memo1.Text[I]=',' Then
       S := S + #13#10
    Else if memo1.Text[I]='\' Then
       S := S + ''''
    Else if memo1.Text[I]='''' Then
    Else S := S + memo1.Text[I];
 End;
 Memo1.TExt := S;
end;

procedure TPadForm.Button5Click(Sender: TObject);
Var I : Integer;
S : String;
begin
  S := '';
 For I := 0 To Memo1.Lines.Count-1 Do Begin
   if Length(Memo1.Lines[I]) > 0 Then
   S := S + '             <start>' +Copy(Memo1.Lines[I],1,3)+'</start>' + #13#10;
 End;
 For I := 0 To Memo1.Lines.Count-1 Do Begin
   if Length(Memo1.Lines[I]) > 3 Then
   S := S + '             <middle>' +Copy(Memo1.Lines[I],4,2)+'</middle>' + #13#10;
 End;
 For I := 0 To Memo1.Lines.Count-1 Do Begin
   if Length(Memo1.Lines[I]) > 6 Then
   S := S + '             <end>' +Copy(Memo1.Lines[I],7,100)+'</end>' + #13#10;
 End;
 Memo1.TExt := S;
end;

end.
