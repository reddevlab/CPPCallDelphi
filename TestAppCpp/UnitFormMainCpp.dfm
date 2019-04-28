object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Cpp Call Delphi'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object BtCaricaDll: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 105
      Height = 25
      Align = alLeft
      Caption = 'Carica Dll'
      TabOrder = 0
      OnClick = BtCaricaDllClick
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 114
      Top = 3
      Width = 105
      Height = 25
      Align = alLeft
      Caption = 'Carica righe'
      TabOrder = 1
      ExplicitLeft = 136
    end
  end
  object MmInfo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 629
    Height = 262
    Align = alClient
    Lines.Strings = (
      'MmInfo')
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
