#module ITSF::FundReports
#  class ProfitCalculator
#    attr_accessor :buy_trades
#    attr_accessor :sell_trades
#    attr_accessor :buy_quantity
#    attr_accessor :sell_quantity
#    attr_accessor :direction

#    alias :quantity :buy_quantity

#    def initialize(buy_trades = [], sell_trades = [])
#      # trades.delete_if {|trade| sell_trades << trade if trade.sell?}
#      self.buy_trades = buy_trades
#      self.sell_trades = sell_trades
#      
#      self.buy_quantity = buy_trades.collect { |trade| trade[:quantity] }.sum
#      self.sell_quantity = sell_trades.collect { |trade| trade[:quantity] }.sum
#      raise "Must have the same quantity for sell and buy trades to calculate profit." if -self.buy_quantity != self.sell_quantity
#    end # def

#    def merged_buy_price
#      calculate_merged_price(buy_trades)
#      # buy_trades.reduce(0.0) { |sum, trade| sum += (trade[:price] * trade[:quantity]) } / buy_trades.collect { |trade| trade[:quantity] }.sum
#    end # def

#    def merged_sell_price
#      calculate_merged_price(sell_trades)
#    end # def

#    def points
#      calculate_absolute_profit_points
#    end # def

#    private

#    def calculate_absolute_profit_points
#      (merged_sell_price * sell_quantity) - (merged_buy_price * buy_quantity)
#    end # def
#    
#    def calculate_merged_price(trades)
#      o = trades.reduce(0.0) { |sum, trade| sum += (trade[:price] * trade[:quantity]) } / trades.collect { |trade| trade[:quantity].abs }.sum
#      p o 
#      o
#    end # def
#  end # class ProfitCalculator
#end # module ITSF::FundReports
