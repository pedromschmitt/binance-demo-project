class BinanceChartController < ApplicationController
  def index
    @symbol = 'ADABNB'
    @data = BinanceService::Klines.new(symbol: @symbol, interval: '1h').call
    @data_last50 = @data.take(50)
    @opens_values = @data_last50.collect(&:second).map(&:to_f)
    @last_5_days_moving_average = moving_average(@opens_values, 5, 8)
  end

  private

  def moving_average(array, ndays, precision)
    array.each_cons(ndays).map { |e| e.reduce(&:+).fdiv(ndays).round(precision) }
  end
end
