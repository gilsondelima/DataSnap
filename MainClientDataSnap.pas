unit MainClientDataSnap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    MemoResponse: TMemo;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ClientClassesUnit1, ClientModuleUnit1, ServerMethodsUnit1;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  proxy: TServerMethods1;
  myMVPCustomer: TClientDataSet;
begin
  MemoResponse.Lines.Text := ClientModule1.ServerMethods1Client.EchoString('Oi Delphi!!!');
  ClientDataSet1 :=  ClientModule1.ServerMethods1Client.ResponseDataSet;
{
  ClientModule1.SQLConnection1.Open;
  proxy := nil;
  try
    proxy := TServerMethods1Client.Create(ClientModule1.SQLConnection1.DBXConnection);
     MemoResponse.Lines.Text := proxy.EchoString('Aló Delphi!!!');
    {myMVPCustomer := JSONToCustomer(proxy.MVPCustomer);
    MemoResponse.Lines.Text := myMVPCustomer.ToString;

    myMVPCustomer.Free;
  finally
    ClientModule1.SQLConnection1.Close;
    proxy.Free;
  end;
end;

{
var
  proxy: TServerMethods1Client;
  myMVPCustomer: TCustomClientDataSet;
begin
  ClientModule1.SQLConnection1.Open;
  proxy := nil;
  try
    proxy := TServerMethods1Client.Create(ClientModule1.SQLConnection1.DBXConnection);
    myMVPCustomer := JSONToCustomer(CustomerToJSON(proxy.ResponseDataSet));
    MemoResponse.Lines.Text := myMVPCustomer.ToString;
    myMVPCustomer.Free;
  finally
    ClientModule1.SQLConnection1.Close;
    proxy.Free;
  end;
  }
end;
end.
