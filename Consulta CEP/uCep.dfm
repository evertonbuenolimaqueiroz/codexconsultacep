object Fcep: TFcep
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consutar CEP'
  ClientHeight = 388
  ClientWidth = 822
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgprincipal: TPageControl
    Left = 0
    Top = 43
    Width = 822
    Height = 345
    ActivePage = tsconsulta
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 96
    ExplicitTop = 232
    ExplicitWidth = 289
    ExplicitHeight = 193
    object tsconsulta: TTabSheet
      Caption = 'Consulta'
      ExplicitWidth = 281
      ExplicitHeight = 165
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 814
        Height = 317
        Align = alClient
        DataSource = dsconsultadados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'logradouro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bairro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ibge'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'estado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'complemento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'latitude'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'longitude'
            Visible = True
          end>
      end
    end
    object tsdados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      ExplicitLeft = 8
      object Label1: TLabel
        Left = 16
        Top = 144
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label2: TLabel
        Left = 184
        Top = 144
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object Label3: TLabel
        Left = 392
        Top = 144
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label4: TLabel
        Left = 528
        Top = 144
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label5: TLabel
        Left = 712
        Top = 144
        Width = 59
        Height = 13
        Caption = 'IBGE Cidade'
      end
      object Label6: TLabel
        Left = 16
        Top = 200
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label7: TLabel
        Left = 184
        Top = 200
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label8: TLabel
        Left = 392
        Top = 200
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label9: TLabel
        Left = 528
        Top = 200
        Width = 47
        Height = 13
        Caption = 'Longitude'
      end
      object Label10: TLabel
        Left = 664
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Latitude'
      end
      object btncep: TSpeedButton
        Left = 146
        Top = 163
        Width = 23
        Height = 22
        Hint = 'Clique para Buscar CEP'
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        OnClick = btncepClick
      end
      object RadioGroup1: TRadioGroup
        Left = 16
        Top = 64
        Width = 778
        Height = 65
        Caption = ' Buscar CEP por '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'API'
          'API Horse')
        TabOrder = 0
      end
      object edtcep: TDBEdit
        Left = 16
        Top = 163
        Width = 132
        Height = 21
        DataField = 'cep'
        DataSource = dsconsultadados
        TabOrder = 1
      end
      object edtlogradouro: TDBEdit
        Left = 184
        Top = 163
        Width = 193
        Height = 21
        DataField = 'logradouro'
        DataSource = dsconsultadados
        TabOrder = 2
      end
      object edtbairro: TDBEdit
        Left = 392
        Top = 163
        Width = 130
        Height = 21
        DataField = 'bairro'
        DataSource = dsconsultadados
        TabOrder = 3
      end
      object edtcidade: TDBEdit
        Left = 528
        Top = 163
        Width = 178
        Height = 21
        DataField = 'cidade'
        DataSource = dsconsultadados
        TabOrder = 4
      end
      object edtibge: TDBEdit
        Left = 712
        Top = 163
        Width = 82
        Height = 21
        DataField = 'ibge'
        DataSource = dsconsultadados
        TabOrder = 5
      end
      object edtestado: TDBEdit
        Left = 16
        Top = 219
        Width = 153
        Height = 21
        DataField = 'estado'
        DataSource = dsconsultadados
        TabOrder = 6
      end
      object edtnumero: TDBEdit
        Left = 184
        Top = 219
        Width = 193
        Height = 21
        DataField = 'numero'
        DataSource = dsconsultadados
        TabOrder = 7
      end
      object edtcomplemento: TDBEdit
        Left = 392
        Top = 219
        Width = 130
        Height = 21
        DataField = 'complemento'
        DataSource = dsconsultadados
        TabOrder = 8
      end
      object edtlongitude: TDBEdit
        Left = 528
        Top = 219
        Width = 130
        Height = 21
        DataField = 'longitude'
        DataSource = dsconsultadados
        TabOrder = 9
      end
      object edtlatitude: TDBEdit
        Left = 664
        Top = 219
        Width = 130
        Height = 21
        DataField = 'latitude'
        DataSource = dsconsultadados
        TabOrder = 10
      end
    end
  end
  object ncep: TDBNavigator
    Left = 0
    Top = 0
    Width = 822
    Height = 43
    DataSource = dsconsultadados
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Align = alTop
    TabOrder = 1
  end
  object dsconsultadados: TDataSource
    DataSet = DM.qycep
    OnStateChange = dsconsultadadosStateChange
    Left = 748
    Top = 72
  end
end
