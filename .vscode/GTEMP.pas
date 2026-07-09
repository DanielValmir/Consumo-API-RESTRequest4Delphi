unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtAno: TEdit;
    btnConsultar: TButton;
    memoResultado: TMemo;
    procedure btnConsultarClick(Sender: TObject);
  private
    function ConsultarFeriados(const AAno: Word): string;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses REST.Types, RESTRequest4D, System.JSON;

function TfrmPrincipal.ConsultarFeriados(const AAno: Word): string;
var
  lResponse: IResponse;
begin
  lResponse := TRequest.New
    .BaseURL('https://brasilapi.com.br')
    .Resource('api/feriados/v1/{ano}')
    .AddUrlSegment('ano', AAno.ToString)
    .Accept(CONTENTTYPE_APPLICATION_JSON)
    .RaiseExceptionOn500(True)
    .Get;

  if lResponse.StatusCode <> 200 then
    raise Exception.CreateFmt('Falha ao consultar feriados (HTTP %d): %s',
      [lResponse.StatusCode, lResponse.StatusText]);

  Result := lResponse.Content;
end;

procedure TfrmPrincipal.btnConsultarClick(Sender: TObject);
var
  lAno: Integer;
  lJSON: TJSONArray;
  lItem: TJSONValue;
begin
  if not TryStrToInt(edtAno.Text, lAno) or (lAno < 1900) or (lAno > 2100) then
  begin
    ShowMessage('Informe um ano válido (ex: 2026).');
    Exit;
  end;

  memoResultado.Lines.Clear;
  try
    lJSON := TJSONArray(TJSONObject.ParseJSONValue(ConsultarFeriados(lAno)));
    try
      for lItem in lJSON do
        memoResultado.Lines.Add(Format('%s  %-35s  %s',
          [lItem.GetValue<string>('date'),
           lItem.GetValue<string>('name'),
           lItem.GetValue<string>('weekday')]));
    finally
      lJSON.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao consultar API: ' + E.Message);
  end;
end;

end.
