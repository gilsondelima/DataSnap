unit ClientClassesUnit1;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Datasnap.DBClient, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FResponseDataSetCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function ResponseDataSet: TClientDataSet;
  end;

implementation

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ResponseDataSet: TClientDataSet;
begin
  if FResponseDataSetCommand = nil then
  begin
    FResponseDataSetCommand := FDBXConnection.CreateCommand;
    FResponseDataSetCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FResponseDataSetCommand.Text := 'TServerMethods1.ResponseDataSet';
    FResponseDataSetCommand.Prepare;
  end;
  FResponseDataSetCommand.ExecuteUpdate;
  if not FResponseDataSetCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FResponseDataSetCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TClientDataSet(FUnMarshal.UnMarshal(FResponseDataSetCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FResponseDataSetCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FResponseDataSetCommand.DisposeOf;
  inherited;
end;

end.




//
// Created by the DataSnap proxy generator.
// 30/10/2013 23:47:36
//
{
unit ClientClassesUnit1;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy,
  System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders,
  Data.DBXCDSReaders, Data.DBXJSONReflect, Datasnap.DBClient;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FResponseDataSetCommand:  TDBXCommand;
    FMVPCustomerCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function ResponseDataSet: TClientDataSet;

    function MVPCustomer: TJSONValue;
  end;

implementation

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;


function TServerMethods1Client.ResponseDataSet: TClientDataSet;
begin
  if FResponseDataSetCommand = nil then
  begin
    FResponseDataSetCommand := FDBXConnection.CreateCommand;
    FResponseDataSetCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FResponseDataSetCommand.Text := 'TServerMethods1.ResponseDataSet';
    FResponseDataSetCommand.Prepare;
  end;
  FResponseDataSetCommand.ExecuteUpdate;
  if not FResponseDataSetCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FResponseDataSetCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TClientDataSet(FUnMarshal.UnMarshal(FResponseDataSetCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FResponseDataSetCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;


function TServerMethods1Client.MVPCustomer: TJSONValue;
begin
  if FMVPCustomerCommand = nil then
  begin
    FMVPCustomerCommand := FDBXConnection.CreateCommand;
    FMVPCustomerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FMVPCustomerCommand.Text := 'TServerMethods1.MVPCustomer';
    FMVPCustomerCommand.Prepare;
  end;
  FMVPCustomerCommand.ExecuteUpdate;
  Result := TJSONValue(FMVPCustomerCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;


function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

end.

}

//
// Created by the DataSnap proxy generator.
// 31/10/2013 01:21:24
//

