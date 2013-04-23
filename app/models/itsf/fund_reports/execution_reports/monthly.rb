module ITSF::FundReports
  module ExecutionReports
    class Monthly
      extend ActiveModel::Translation

      attr_accessor :executions, :date_range, :trades, :trades_by_day

      def initialize(executions, date_range)
        self.date_range = date_range
        self.executions = executions
      end # def

      def pl
        # ap trades
        pl = trades.reduce(0) { |pl, trade| pl += trade.pl }
      end # def

      def trades
        @trades ||= pair_trades
      end # def

      def trades_by_day
        @trades_by_day ||= trades.group_by(&:close_day).sort
      end

      private

      def pair_trades
        trades = []

        execs = executions
        while (execs.size > 0)
          open = execs.shift
          close_index = execs.find_index do |item|
            item.quantity == open.quantity and
            item.account == open.account and
            item.action != open.action and
            item.currency == open.currency and
            item.exchange == open.exchange and
            item.underlying == open.underlying and
            item.order_reference == open.order_reference
          end # select!
          unless close_index.nil?
            close = execs.delete_at(close_index)
            trades << ITSF::FundReports::Trade.new(open, close)
          end
        end

#          open = executions.shift
#          executions.each do |item|
#          end
#          close_index = executions.find_index do |item|
#            item.quantity == open.quantity
#            item.account == open.account
#            item.action != open.action
#            item.currency == open.currency
#            item.exchange == open.exchange
#            item.underlying == open.underlying
#          end # select!
#          close = executions[close_index] and executions.delete(close_index) unless close_index.nil?
#          trades << ITSF::FundReports::Trade.new(open, close)
        trades
      end # def
    end # class Monthly
  end # module ExecutionReports
end # module ITSF::FundReports

