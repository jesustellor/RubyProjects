require 'net/http'
require 'json'

url = URI.parse('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo')
response = Net::HTTP.get_response(url)
data = JSON.parse(response.body)
open_prices = data['Time Series (5min)'].map { |time, data| time + ' ' + data['1. open'] }


def stock_picker(prices)
  best_profit = 0
  start_day = 0
  end_day = 0

  (0..prices.size - 2).each do |i|
    (i+1..prices.size - 1).each do |j|
      profit = prices[j].split.last.to_f - prices[i].split.last.to_f
      if profit > best_profit
        best_profit = profit
        start_day = i
        end_day = j
      end
    end
  end

  [start_day, end_day]
end

puts stock_picker(open_prices)