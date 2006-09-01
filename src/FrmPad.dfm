object PadForm: TPadForm
  Left = 285
  Top = 270
  Width = 870
  Height = 640
  BorderWidth = 5
  Caption = 'Padding'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 105
    Width = 852
    Height = 491
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 26
      Height = 13
      Caption = 'Prefix'
    end
    object Label2: TLabel
      Left = 8
      Top = 45
      Width = 26
      Height = 13
      Caption = 'Suffix'
    end
    object Edit1: TEdit
      Left = 96
      Top = 16
      Width = 249
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 96
      Top = 40
      Width = 249
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 96
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Do It'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 176
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Clean Spec'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 256
      Top = 72
      Width = 75
      Height = 25
      Caption = 'TRIM'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 336
      Top = 72
      Width = 75
      Height = 25
      Caption = 'WrapPad'
      TabOrder = 5
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 416
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Cutup'
      TabOrder = 6
      OnClick = Button5Click
    end
  end
end
