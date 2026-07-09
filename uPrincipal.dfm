object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Feriados - BrasilAPI'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object edtAno: TEdit
    Left = 8
    Top = 8
    Width = 80
    Height = 23
    MaxLength = 4
    TabOrder = 0
    Text = '2026'
  end
  object btnConsultar: TButton
    Left = 96
    Top = 8
    Width = 120
    Height = 23
    Caption = 'Consultar Feriados'
    TabOrder = 1
    OnClick = btnConsultarClick
  end
  object memoResultado: TMemo
    Left = 8
    Top = 40
    Width = 608
    Height = 393
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
