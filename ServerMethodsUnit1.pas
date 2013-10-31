unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
     Data.DB, Datasnap.DBClient,
      Data.DBXJSON, Data.DBXJSONReflect,  IPPeerClient;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }

  protected
    function GetCustomer: TClientDataSet;
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function ResponseDataSet : TClientDataSet;

    function MVPCustomer(): TJSONValue;

  end;
{$METHODINFO OFF}


    function CustomerToJSON(customer: TClientDataSet): TJSONValue;
    function JSONToCustomer(json: TJSONValue): TClientDataSet;


implementation


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetCustomer: TClientDataSet;
begin
  Result := TClientDataSet.Create(self);
end;

function TServerMethods1.MVPCustomer(): TJSONValue;
var
  myCustomer: TClientDataSet;
begin
  myCustomer := GetCustomer;
  Result := CustomerToJSON(myCustomer);
  myCustomer.Free;
end;

function TServerMethods1.ResponseDataSet: TClientDataSet;
Var
  MyCliente :TClientDataSet;
begin
  myCliente := TClientDataSet.Create(self);
  myCliente.Close;
  myCliente.FieldDefs.Clear;
  myCliente.FieldDefs.Add('CodSimOuNao',ftInteger);
  myCliente.FieldDefs.Add('DescSimOuNao',ftString, 30);
  with  myCliente do
  Begin
    CreateDataSet;
    FieldByName('CodSimOuNao').DisplayLabel := 'Código';
    FieldByName('CodSimOuNao').Alignment := taCenter;
    FieldByName('DescSimOuNao').DisplayLabel := 'Descrição';
  End;
  // Limpamos todos os registro da tabela

  myCliente.DisableControls;
  myCliente.FieldDefs.Clear;

  myCliente.Append; // Inserimos dados
  myCliente.FieldByName('CodSimOuNao').AsInteger := 0;
  myCliente.FieldByName('DescSimOuNao').AsString := 'Não';
  myCliente.Post;

  myCliente.Append; // Inserimos dados
  myCliente.FieldByName('CodSimOuNao').AsInteger := 1;
  myCliente.FieldByName('DescSimOuNao').AsString := 'Sim';
  myCliente.Post;
  myCliente.Open;
  //Result :=  ClienteToJSON(myCliente);
  Result := myCliente;
  myCliente.Free;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function CustomerToJSON(customer: TClientDataSet): TJSONValue;
  var
    m: TJSONMarshal;
  begin
    if Assigned(customer) then
    begin
      m := TJSONMarshal.Create(TJSONConverter.Create);
      try
        exit(m.Marshal(customer))
      finally
        m.Free;
      end;
    end
    else
      exit(TJSONNull.Create);
  end;

  function JSONToCustomer(json: TJSONValue): TClientDataSet;
  var
     unm: TJSONUnMarshal;
  begin
    if json is TJSONNull then
      exit(nil);
    unm := TJSONUnMarshal.Create;
    try
      exit(unm.Unmarshal(json) as TClientDataSet)
    finally
      unm.Free;
    end;
  end;

end.

