module ITSF::FundReports
  class TradeGroup < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_trade_groups'

    # associations
    belongs_to :symbol
    belongs_to :underlying_symbol, :class_name => Underlying
    has_many :trades, :class_name => Trades::Trade

    # attributes
    attr_accessible :description,
                    :first_open_time,
                    :last_close_time,
                    :multiplier,
                    :pnl_points,
                    :underlying_symbol_id,
                    :symbol_id

    # callbacks
    before_save :set_first_open_time
    before_save :set_last_close_time
    before_save :calculate_pnl_points
    before_save :set_multiplier
    before_save :set_symbol    
    before_save :set_underlying_symbol

    # validations
    validate :validate_trades


#    validates :first_open_time, :presence => true
#    validates :last_close_time, :presence => true
#    validates :multiplier, :presence => true
#    # validates :pnl_points, :presence => true
#    validates :symbol, :presence => true
#    validates :underlying_symbol, :presence => true

    def trades_count
      trades.count
    end # def

    private

    def calculate_pnl_points
      # ITSF::FundReports::ProfitCalculator.new(trades).points
    end # def

    def set_first_open_time
      # self.first_open_time = trades.order(:order_time).first.try(:order_time)
      self.first_open_time = trades.all.sort! { |a, b|  a.trade_time <=> b.trade_time }.first.try(:trade_time)
    end # def

    def set_last_close_time
      # self.last_close_time = trades.order(:order_time).last.try(:order_time)
      self.last_close_time = trades.all.sort! { |a, b|  a.trade_time <=> b.trade_time }.last.try(:trade_time)
    end # def

    def set_multiplier
      self.multiplier = trades.first.multiplier
    end # def

    def set_symbol
      self.symbol = trades.first.symbol
    end # def

    def set_underlying_symbol
      self.underlying_symbol = trades.first.underlying_symbol
    end # def

    def validate_trades
      errors.add(:trades, "needs at least 2 trades") if trades.size < 2
    end # def
  end # class TradeGroup < ActiveRecord::Base
end # module ITSF::FundReports
