
DROP TABLE IF EXISTS dim_ativos; 
DROP TABLE IF EXISTS dim_moedas; 

CREATE TABLE dim_ativos (
    Ativo VARCHAR(20) PRIMARY KEY, 
    Nome_Completo VARCHAR(100),
    Simbolo VARCHAR(20),
    URL_Imagem VARCHAR(500),
    Tipo VARCHAR(20)
);

INSERT INTO dim_ativos (Ativo, Nome_Completo, Simbolo, Tipo, URL_Imagem) VALUES
('BITCOIN', 'Bitcoin', 'BTC', 'Cripto', 'https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=025'),
('ETHEREUM', 'Ethereum', 'ETH', 'Cripto', 'https://cryptologos.cc/logos/ethereum-eth-logo.png?v=025'),
('BNB', 'Binance Coin', 'BNB', 'Cripto', 'https://cryptologos.cc/logos/bnb-bnb-logo.png?v=025'),
('SOLANA', 'Solana', 'SOL', 'Cripto', 'https://cryptologos.cc/logos/solana-sol-logo.png?v=025'),
('XRP', 'Ripple', 'XRP', 'Cripto', 'https://cryptologos.cc/logos/xrp-xrp-logo.png?v=025'),
('DOGECOIN', 'Dogecoin', 'DOGE', 'Cripto', 'https://cryptologos.cc/logos/dogecoin-doge-logo.png?v=025'),
('CARDANO', 'Cardano', 'ADA', 'Cripto', 'https://cryptologos.cc/logos/cardano-ada-logo.png?v=025'),
('TRON', 'TRON', 'TRX', 'Cripto', 'https://cryptologos.cc/logos/tron-trx-logo.png?v=025'),
('AVALANCHE-2', 'Avalanche', 'AVAX', 'Cripto', 'https://cryptologos.cc/logos/avalanche-avax-logo.png?v=025'),
('SHIBA-INU', 'Shiba Inu', 'SHIB', 'Cripto', 'https://cryptologos.cc/logos/shiba-inu-shib-logo.png?v=025'),
('POLKADOT', 'Polkadot', 'DOT', 'Cripto', 'https://cryptologos.cc/logos/polkadot-new-dot-logo.png?v=025'),
('CHAINLINK', 'Chainlink', 'LINK', 'Cripto', 'https://cryptologos.cc/logos/chainlink-link-logo.png?v=025'),
('LITECOIN', 'Litecoin', 'LTC', 'Cripto', 'https://cryptologos.cc/logos/litecoin-ltc-logo.png?v=025'),
('NEAR', 'NEAR Protocol', 'NEAR', 'Cripto', 'https://cryptologos.cc/logos/near-protocol-near-logo.png?v=025'),
('USDT', 'Tether', 'USDT', 'Cripto', 'https://cryptologos.cc/logos/tether-usdt-logo.png?v=025');

INSERT INTO dim_ativos (Ativo, Nome_Completo, Simbolo, Tipo, URL_Imagem) VALUES
('PETR4', 'Petrobras PN', 'PETR4', 'Acao_BR', 'https://img.logo.dev/petrobras.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('VALE3', 'Vale S.A.', 'VALE3', 'Acao_BR', 'https://img.logo.dev/vale.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('ITUB4', 'Ita� Unibanco', 'ITUB4', 'Acao_BR', 'https://logodownload.org/wp-content/uploads/2014/05/itau-logo-1.png'),
('BBAS3', 'Banco do Brasil', 'BBAS3', 'Acao_BR', 'https://logodownload.org/wp-content/uploads/2014/05/banco-do-brasil-logo-1.png'),
('WEGE3', 'WEG S.A.', 'WEGE3', 'Acao_BR', 'https://img.logo.dev/name/weg%20s.a?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('BBDC4.SA', 'Banco Bradesco', 'BBDC4.SA', 'Acao_BR', 'https://img.logo.dev/name/bradesco?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('B3SA3.SA', 'Brasil Bolsa Balcao', 'B3SA3.SA', 'Acao_BR', 'https://img.logo.dev/name/b3?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('ABEV3.SA', 'Ambev', 'ABEV3.SA', 'Acao_BR', 'https://img.logo.dev/name/AMBEV?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('RENT3.SA', 'Localiza Rent a Car', 'RENT3.SA', 'Acao_BR', 'https://img.logo.dev/name/Localiza?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('ITSA4.SA', 'Itausa', 'ITSA4.SA', 'Acao_BR', 'https://img.logo.dev/name/ita%C3%BAsa?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('BPAC11.SA', 'BTG Pactual', 'BPAC11.SA', 'Acao_BR', 'https://img.logo.dev/name/BTG%20Pactual?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('SUZB3.SA', 'Suzano Papel e Celulose', 'SUZB3.SA', 'Acao_BR', 'https://img.logo.dev/name/Suzano?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('HAPV3.SA', 'Hapvida', 'HAPV3.SA', 'Acao_BR', 'https://img.logo.dev/hapvida.com.br?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('RDOR3.SA', 'Rede DOr', 'RDOR3.SA', 'Acao_BR', 'https://img.logo.dev/rededor.com.br?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('^BVSP', 'IBOVESPA', 'IBOV', 'Indice', 'https://logodownload.org/wp-content/uploads/2019/09/b3-logo-0.png');

INSERT INTO dim_ativos (Ativo, Nome_Completo, Simbolo, Tipo, URL_Imagem) VALUES
('AAPL', 'Apple Inc.', 'AAPL', 'Acao_USA', 'https://img.logo.dev/apple.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('MSFT', 'Microsoft', 'MSFT', 'Acao_USA', 'https://img.logo.dev/microsoft.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('GOOGL', 'Alphabet (Google)', 'GOOGL', 'Acao_USA', 'https://img.logo.dev/google.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('AMZN', 'Amazon', 'AMZN', 'Acao_USA', 'https://img.logo.dev/amazon.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('NVDA', 'NVIDIA', 'NVDA', 'Acao_USA', 'https://img.logo.dev/nvidia.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('TSLA', 'Tesla', 'TSLA', 'Acao_USA', 'https://img.logo.dev/name/tesla?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('META', 'Meta Platforms', 'META', 'Acao_USA', 'https://img.logo.dev/meta.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('NFLX', 'Netflix', 'NFLX', 'Acao_USA', 'https://img.logo.dev/netflix.com?token=pk_OGkgusCYSoSRIdJ69xegbA&retina=true'),
('^NDX', 'Nasdaq 100', 'NDX', 'Indice', 'https://logo.clearbit.com/nasdaq.com');

-- Confere se carregou tudo
SELECT * FROM dim_ativos;