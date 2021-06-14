object Form1: TForm1
  Left = 192
  Top = 125
  Width = 979
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 64
    Top = 40
    Width = 75
    Height = 25
    Caption = 'CopyStr'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 328
    Top = 40
    Width = 75
    Height = 25
    Caption = 'GetStr'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 576
    Top = 88
    Width = 75
    Height = 25
    Caption = 'CreateBuf'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 576
    Top = 120
    Width = 75
    Height = 25
    Caption = 'DelBuf'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 96
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object Memo2: TMemo
    Left = 272
    Top = 96
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo2')
    TabOrder = 5
  end
  object Button5: TButton
    Left = 576
    Top = 152
    Width = 75
    Height = 25
    Caption = 'CheckBuf'
    TabOrder = 6
    OnClick = Button5Click
  end
end
