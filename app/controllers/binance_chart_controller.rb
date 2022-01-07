class BinanceChartController < ApplicationController
  def index
    @symbol = 'ADABNB'
    @data = BinanceService::Klines.new(symbol: @symbol, interval: '1h').call
    @data_last_50 = @data.take(50)
    @opens = @data_last_50.collect(&:second).map(&:to_f)
    @last_5_days_moving_average = moving_average(@opens, 5, 8)
  end

  private

  def moving_average(a, ndays, precision)
    a.each_cons(ndays).map { |e| e.reduce(&:+).fdiv(ndays).round(precision) }
  end
end
