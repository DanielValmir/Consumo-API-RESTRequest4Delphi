# Consumo API REST Request4Delphi

Exemplo simples em Delphi (VCL) de consumo de API REST usando a biblioteca
[RESTRequest4Delphi](https://github.com/andre-mnemus/RESTRequest4Delphi).

A aplicação consulta a [BrasilAPI](https://brasilapi.com.br) para listar os
feriados nacionais de um ano informado pelo usuário.

## Funcionamento

1. Informe um ano (1900–2100) no campo de texto.
2. Clique em **Consultar Feriados**.
3. A aplicação faz um `GET` em `https://brasilapi.com.br/api/feriados/v1/{ano}`,
   interpreta o JSON retornado e lista data, nome e dia da semana de cada
   feriado no memo de resultado.

## Estrutura

- [ConsumoAPIRESTRequest4Delphi.dpr](ConsumoAPIRESTRequest4Delphi.dpr) — projeto principal.
- [uPrincipal.pas](uPrincipal.pas) / [uPrincipal.dfm](uPrincipal.dfm) — formulário único (`TfrmPrincipal`) com a chamada REST e o parsing do JSON.

## Requisitos

- Delphi (testado em versões com suporte a `System.JSON` e RTL atual).
- Pacote **RESTRequest4Delphi** instalado (via Boss ou manualmente).

## Executando

Abra `ConsumoAPIRESTRequest4Delphi.dproj` no Delphi, compile e execute.
