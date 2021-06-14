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
  hMapObj: THandle;   //проецируемый в память файл
  pMapView:Pointer;   //указывает сколько байт будет считано
  s:string;           //строка
  check:boolean;      //проверка буфера
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);   //копирование данных в буфер
begin
  s:=Memo1.Lines[0];      //строке присваивается строка из Memo1
  CopyMemory(pMapView, PChar(s), length(s)+1);    //копируется по байтово
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  s:=PChar(pMapView);    //преобразование отображение файла в адресном пространстве в строку
  Memo2.Lines[0]:=s;      //вывод строки из буфера в memo

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  hMapObj:=OpenFileMapping(FILE_MAP_ALL_ACCESS, FALSE, 'shared_memory');   //попытка открыть файл
    if(hMapObj=0) then    //если файл не создан
    begin
    hMapObj:=CreateFileMapping(INVALID_HANDLE_VALUE, Nil, PAGE_READWRITE,  0, 1*1024*1024, 'shared_memory');  //создаем его(размер 1МБ)
    if(hMapObj<>0) then
      begin
      ShowMessage('Файл успешно создан');
      check:=true;
      end
    end
  else if(hMapObj<>0) then
  begin
    ShowMessage('Файл уже создан');
    check:=true;
  end;
  GetMem(pMapView, 1*1024*1024);    //выделение памяти (1МБ) в адресном пространстве
  pMapView:=MapViewOfFile(hMapObj, FILE_MAP_ALL_ACCESS, 0, 0, 0);
end;           //проецируем данные в адресное пространство процесса

procedure TForm1.Button4Click(Sender: TObject);
begin
  UnmapViewOfFile(pMapView);    //Отключение файловых данных от адресного пространства процесса
  CloseHandle(hMapObj);         //Закрытие объекта проекции файла
  ShowMessage('Буфер уничтожен');
  check:=false;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if(check=true) then
    ShowMessage('Буфер существует и готов к работе')
  else
    ShowMessage('Буфер не существует')
end;

end.
