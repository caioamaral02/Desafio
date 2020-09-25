object DM: TDM
  OldCreateOrder = False
  Height = 173
  Width = 262
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Users\che_g\Desktop\Desafio\DB_DESAFIO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    Left = 200
    Top = 32
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Users\che_g\Desktop\Desafio\fbclient.dll'
    Left = 128
    Top = 32
  end
  object Query: TFDQuery
    Connection = Conexao
    Left = 56
    Top = 32
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 8
    Top = 32
  end
end
