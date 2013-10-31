object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client DataSnap'
  ClientHeight = 539
  ClientWidth = 1007
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 498
    Width = 1007
    Height = 41
    Align = alBottom
    Alignment = taRightJustify
    BorderWidth = 10
    Caption = 'Client'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 506
    Width = 75
    Height = 25
    Caption = 'Request'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object MemoResponse: TMemo
    Left = 8
    Top = 32
    Width = 185
    Height = 89
    Lines.Strings = (
      'MemoResponse')
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 72
    Top = 272
    Width = 841
    Height = 169
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 336
    Top = 184
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 184
  end
end
