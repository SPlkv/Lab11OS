unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
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
  Form1: TForm1;
  hMapObj: THandle;   //������������ � ������ ����
  pMapView:Pointer;   //��������� ������� ���� ����� �������
  s:string;           //������
  check:boolean;      //�������� ������
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);   //����������� ������ � �����
begin
  s:=Memo1.Lines[0];      //������ ������������� ������ �� Memo1
  CopyMemory(pMapView, PChar(s), length(s)+1);    //���������� �� �������
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  s:=PChar(pMapView);    //�������������� ����������� ����� � �������� ������������ � ������
  Memo2.Lines[0]:=s;      //����� ������ �� ������ � memo

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  hMapObj:=OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, 'shared_memory');   //������� ������� ����
    if(hMapObj=0) then    //���� ���� �� ������
    begin
    hMapObj:=CreateFileMapping(INVALID_HANDLE_VALUE, Nil, PAGE_READWRITE,  0, 1*1024*1024, 'shared_memory');  //������� ���(������ 1��)
    if(hMapObj<>0) then
      begin
      ShowMessage('���� ������� ������');
      check:=true;
      end
    end
  else if(hMapObj<>0) then
  begin
    ShowMessage('���� ��� ������');
    check:=true;
  end;
  GetMem(pMapView, 1*1024*1024);    //��������� ������ (1��) � �������� ������������
  pMapView:=MapViewOfFile(hMapObj, FILE_MAP_ALL_ACCESS, 0, 0, 0);
end;           //���������� ������ � �������� ������������ ��������

procedure TForm1.Button4Click(Sender: TObject);
begin
  UnmapViewOfFile(pMapView);    //���������� �������� ������ �� ��������� ������������ ��������
  CloseHandle(hMapObj);         //�������� ������� �������� �����
  ShowMessage('����� ���������');
  check:=false;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if(check=true) then
    ShowMessage('����� ���������� � ����� � ������')
  else
    ShowMessage('����� �� ����������')
end;

end.
