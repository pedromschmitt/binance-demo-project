require 'rails_helper'

describe BinanceService do
  context 'When calling klines' do
    let(:symbol) { 'ADABNB' }
    let(:interval) { '1h' }
    let(:api_return) do
      [
        [
          1_639_699_200_000,
          '0.00235600',
          '0.00236100',
          '0.00234900',
          '0.00235200',
          '30636.20000000',
          1_639_702_799_999,
          '72.18373230',
          129,
          '14746.10000000',
          '34.75720270',
          '0'
        ],
        [
          1_639_702_800_000,
          '0.00234900',
          '0.00236000',
          '0.00234900',
          '0.00235400',
          '72000.40000000',
          1_639_706_399_999,
          '169.30687340',
          117,
          '52587.20000000',
          '123.63091110',
          '0'
        ]
      ]
    end

    before do
      allow(RestClient).to receive(:get) { OpenStruct.new(body: api_return.to_json) }
    end

    it '#call' do
      binance_service_kline = BinanceService::Klines.new(symbol: symbol, interval: interval).call
      expect(binance_service_kline).to eq api_return
    end
  end
end
