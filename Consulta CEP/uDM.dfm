object DM: TDM
  OldCreateOrder = False
  Height = 576
  Width = 908
  object con: TFDConnection
    Params.Strings = (
      'Database=CodeXCEP'
      'User_Name=postgres'
      'Password=sa'
      'ODBCDriver=PostgreSQL ANSI'
      'DriverID=ODBC')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 32
  end
  object qycep: TFDQuery
    BeforePost = qycepBeforePost
    Connection = con
    SQL.Strings = (
      'SELECT * FROM cep')
    Left = 72
    Top = 96
    object qycepcodigo: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Origin = 'codigo'
    end
    object qycepcep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Origin = 'cep'
      Size = 63
    end
    object qyceplogradouro: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 63
    end
    object qycepbairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 63
    end
    object qycepcidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 63
    end
    object qycepibge: TStringField
      DisplayLabel = 'IBGE'
      FieldName = 'ibge'
      Origin = 'ibge'
      Size = 63
    end
    object qycepestado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Origin = 'estado'
      Size = 63
    end
    object qycepnumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Origin = 'numero'
      Size = 63
    end
    object qycepcomplemento: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 63
    end
    object qyceplatitude: TStringField
      DisplayLabel = 'Latitude'
      FieldName = 'latitude'
      Origin = 'latitude'
      Size = 63
    end
    object qyceplongitude: TStringField
      DisplayLabel = 'Longitude'
      FieldName = 'longitude'
      Origin = 'longitude'
      Size = 63
    end
  end
  object qysql: TFDQuery
    BeforePost = qycepBeforePost
    Connection = con
    SQL.Strings = (
      'SELECT * FROM cep')
    Left = 72
    Top = 160
  end
end
