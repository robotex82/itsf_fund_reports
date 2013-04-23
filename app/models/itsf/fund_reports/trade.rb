module ITSF::FundReports
  class Trade
    extend ActiveModel::Translation

    attr_accessor :open_execution, :close_execution
    attr_reader :pl

    def closed_at
      close_execution.executed_at
    end # def

    def close_day
      closed_at.to_date
    end # def

    def initialize(open_execution, close_execution)
      self.open_execution = open_execution
      self.close_execution = close_execution
      # TODO: check underlying, quantity
    end # def

    def lose?
      !win?
    end # def

    def opened_at
      open_execution.executed_at
    end # def

    def open_day
      opened_at.to_date
    end # def

    def pl_in_points
      if open_execution.sell? and close_execution.buy?
        self.open_execution.price - self.close_execution.price
      elsif open_execution.buy? and close_execution.sell?
        self.close_execution.price - self.open_execution.price
      else
        raise "Can't pair executions with same direction. Executions representing a trade must have opposite directions (sell, buy / buy, sell)\r\n #{self.inspect}"
      end
    end # def

    def pl
      pl_in_points * open_execution.underlying.multiplier * open_execution.quantity
    end # def

    def win?
      pl >= 0
    end # def
  end # class Trade
end # module ITSF::FundReports

