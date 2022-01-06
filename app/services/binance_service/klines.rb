module BinanceService
  class Klines
    def initialize(params)
      @symbol = params[:symbol]
      @interval = params[:interval]
    end

    def call
      exchange_api_url = 'https://api.binance.com/api/v3/klines'
      url = "#{exchange_api_url}?symbol=#{@symbol}&interval=#{@interval}"
      res = RestClient.get url
      JSON.parse(res.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
