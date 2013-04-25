module ITSF::FundReports
  class Trades::Trade < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_trades_trades'

    # associations
    belongs_to :account
    belongs_to :currency
    belongs_to :asset_category
    belongs_to :symbol
    belongs_to :security
    belongs_to :transaction_type
    belongs_to :exchange
    belongs_to :ib_commission_currency, :class_name => Currency
    belongs_to :order_type

    # attributes
    attr_accessible :brokerage_order_ifentifier,
                    :buy_sell,
                    :change_in_price,
                    :change_in_quantity,
                    :clearing_firm_identifier,
                    :close_price,
                    :con_identifier,
                    :cost,
                    :cusip,
                    :description,
                    :exch_order_identifier,
                    :expiry,
                    :ext_exec_identifier,
                    :fifo_pnl_realized,
                    :fx_rate_to_base,
                    :holding_period_date_time,
                    :ib_commission,
                    :ib_exec_identifier,
                    :ib_order_identifier,
                    :issuer,
                    :level_of_detail,
                    :mtm_pnl,
                    :multiplier,
                    :net_cash,
                    :notes,
                    :open_close_indicator,
                    :open_date_time,
                    :order_placement_time,
                    :order_reference,
                    :order_time,
                    :orig_order_identifier,
                    :orig_trade_date,
                    :orig_trade_identifier,
                    :orig_trade_price,
                    :proceeds,
                    :put_call,
                    :quantity,
                    :report_date,
                    :security_id_type,
                    :security_indentifier,
                    :settle_date_target,
                    :strike,
                    :taxes,
                    :trade_identifier,
                    :trade_money,
                    :trade_price,
                    :trade_time,
                    :underlying_con_identifier,
                    :volatility_order_link,
                    :when_realized,
                    :when_reopened

    # validations
    validates :account, :presence => true
    validates :asset_category, :presence => true
    validates :currency, :presence => true
    validates :exchange, :presence => true
    validates :ib_commission_currency, :presence => true
    validates :order_type, :presence => true
    validates :symbol, :presence => true
    validates :transaction_type, :presence => true
  end # class Trades::Trade < ActiveRecord::Base
end # module ITSF::FundReports

