module ITSF::FundReports
  class Trades::Order < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_trades_orders'

    # associations
    belongs_to :account
    belongs_to :action
    belongs_to :currency
    belongs_to :asset_category
    belongs_to :symbol
    belongs_to :security
    belongs_to :transaction_type
    belongs_to :exchange
    belongs_to :ib_commission_currency, :class_name => Currency
    belongs_to :order_type
    belongs_to :flex_query_run, :class_name => ITSF::FundReports::FlexQuery::Run,
                                :foreign_key => 'flex_query_run_id'
    belongs_to :underlying_symbol, :class_name => Underlying

    # attributes
    attr_accessible :account,
                    :action,
                    :asset_category,
                    :brokerage_order_ifentifier,
                    :change_in_price,
                    :change_in_quantity,
                    :clearing_firm_identifier,
                    :close_price,
                    :con_identifier,
                    :cost,
                    :currency,
                    :cusip,
                    :description,
                    :exch_order_identifier,
                    :exchange,
                    :expiry,
                    :ext_exec_identifier,
                    :fifo_pnl_realized,
                    :fx_rate_to_base,
                    :holding_period_date_time,
                    :ib_commission,
                    :ib_commission_currency,
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
                    :order_type,
                    :orig_order_identifier,
                    :orig_trade_date,
                    :orig_trade_identifier,
                    :orig_trade_price,
                    :proceeds,
                    :put_call,
                    :quantity,
                    :report_date,
                    :security,
                    :security_id_type,
                    :security_indentifier,
                    :settle_date_target,
                    :strike,
                    :symbol,
                    :taxes,
                    :trade_identifier,
                    :trade_money,
                    :trade_price,
                    :trade_time,
                    :transaction_type,
                    :underlying_con_identifier,
                    :underlying_symbol,
                    :volatility_order_link,
                    :when_realized,
                    :when_reopened

    # validations
    validates :account, :presence => true
    validates :action, :presence => true
    validates :asset_category, :presence => true
    validates :currency, :presence => true
    validates :exchange, :presence => true
    validates :ib_commission_currency, :presence => true
    validates :ib_order_identifier, :presence => true # ,
#                                     :uniqueness => true
#    validates :ib_exec_identifier, :presence => true,
#                                    :uniqueness => true
    validates :order_type, :presence => true
    validates :quantity, :presence => true
    validates :symbol, :presence => true
    validates :transaction_type, :presence => true
  end # class Trades::Order < ActiveRecord::Base
end # module ITSF::FundReports

