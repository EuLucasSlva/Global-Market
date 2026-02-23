CREATE OR ALTER VIEW vw_Mercado_Global AS

WITH Cotacao_Dolar AS (
    SELECT TOP 1 
        CAST(bid AS DECIMAL(18, 4)) AS bid 
    FROM tb_cotacao_usdt
),

Unificacao AS (
    SELECT 
        CAST(t1.Date AS DATE) AS Date,
        t1.Moeda AS Ativo,
        'Cripto' AS Tipo_Mercado,
        'USD' AS Moeda_Original,
        CAST(t1.[Open Price] AS DECIMAL(28, 8)) AS Open_USD,
        CAST(t1.[High Price] AS DECIMAL(28, 8)) AS High_USD,
        CAST(t1.[Low Price] AS DECIMAL(28, 8)) AS Low_USD,
        CAST(t1.[Close Price] AS DECIMAL(28, 8)) AS Preco_USD,
        CAST(t1.[Open Price] * d.bid AS DECIMAL(28, 8)) AS Open_BRL,
        CAST(t1.[High Price] * d.bid AS DECIMAL(28, 8)) AS High_BRL,
        CAST(t1.[Low Price] * d.bid AS DECIMAL(28, 8)) AS Low_BRL,
        CAST(t1.[Close Price] * d.bid AS DECIMAL(28, 8)) AS Preco_BRL,
        CAST(t1.Market_Cap AS DECIMAL(30, 2)) AS Market_Cap_USD,
        CAST(t1.Market_Cap * d.bid AS DECIMAL(30, 2)) AS Market_Cap_BRL,
        CAST(t1.Volume AS DECIMAL(30, 2)) AS Volume
    FROM tb_binance_historico AS t1
    CROSS JOIN Cotacao_Dolar AS d

    UNION ALL

    SELECT 
        CAST(t2.Date AS DATE) AS Date,
        t2.Ticker AS Ativo,
        'Acao_USA' AS Tipo_Mercado,
        'USD' AS Moeda_Original,
        CAST(t2.[Open] AS DECIMAL(28, 8)) AS Open_USD,
        CAST(t2.[High] AS DECIMAL(28, 8)) AS High_USD,
        CAST(t2.[Low] AS DECIMAL(28, 8)) AS Low_USD,
        CAST(t2.[Close] AS DECIMAL(28, 8)) AS Preco_USD,
        CAST(t2.[Open] * d.bid AS DECIMAL(28, 8)) AS Open_BRL,
        CAST(t2.[High] * d.bid AS DECIMAL(28, 8)) AS High_BRL,
        CAST(t2.[Low] * d.bid AS DECIMAL(28, 8)) AS Low_BRL,
        CAST(t2.[Close] * d.bid AS DECIMAL(28, 8)) AS Preco_BRL,
        NULL AS Market_Cap_USD, 
        NULL AS Market_Cap_BRL,
        CAST(t2.Volume AS DECIMAL(30, 2)) AS Volume
    FROM tb_acoes_nasdaq_historico AS t2
    CROSS JOIN Cotacao_Dolar AS d

    UNION ALL

    SELECT 
        CAST(t3.Date AS DATE) AS Date,
        t3.Ticker AS Ativo,
        'Acao_BR' AS Tipo_Mercado,
        'BRL' AS Moeda_Original,
        CAST(t3.[Open] / NULLIF(d.bid, 0) AS DECIMAL(28, 8)) AS Open_USD,
        CAST(t3.[High] / NULLIF(d.bid, 0) AS DECIMAL(28, 8)) AS High_USD,
        CAST(t3.[Low] / NULLIF(d.bid, 0) AS DECIMAL(28, 8)) AS Low_USD,
        CAST(t3.[Close] / NULLIF(d.bid, 0) AS DECIMAL(28, 8)) AS Preco_USD,
        CAST(t3.[Open] AS DECIMAL(28, 8)) AS Open_BRL,
        CAST(t3.[High] AS DECIMAL(28, 8)) AS High_BRL,
        CAST(t3.[Low] AS DECIMAL(28, 8)) AS Low_BRL,
        CAST(t3.[Close] AS DECIMAL(28, 8)) AS Preco_BRL,
        NULL AS Market_Cap_USD,
        NULL AS Market_Cap_BRL,
        CAST(t3.Volume AS DECIMAL(30, 2)) AS Volume
    FROM tb_acoes_br_historico AS t3
    CROSS JOIN Cotacao_Dolar AS d
)

SELECT 
    Date,
    Ativo,
    Tipo_Mercado,
    Moeda_Original,
    Open_BRL,
    High_BRL,
    Low_BRL,
    Preco_BRL,
    Open_USD,
    High_USD,
    Low_USD,
    Preco_USD,
    Market_Cap_BRL,
    Market_Cap_USD,
    Volume, 
    
    LAG(Preco_BRL, 1, NULL) OVER (PARTITION BY Ativo ORDER BY Date) AS Preco_Ontem,
    LAG(Preco_USD, 1, NULL) OVER (PARTITION BY Ativo ORDER BY Date) AS Preco_Ontem_USD,
    
    CAST(
        (Preco_BRL - LAG(Preco_BRL, 1, NULL) OVER (PARTITION BY Ativo ORDER BY Date)) 
        / NULLIF(LAG(Preco_BRL, 1, NULL) OVER (PARTITION BY Ativo ORDER BY Date), 0) 
    AS DECIMAL(10,4)) AS Variacao_Percentual
FROM Unificacao;