# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :itsf_fund_reports_trades_order, :class => 'ITSF::FundReports::Trades::Order' do
    association :account, :factory => :itsf_fund_reports_account
    association :action, :factory => :itsf_fund_reports_action
    association :currency, :factory => :itsf_fund_reports_currency
    association :asset_category, :factory => :itsf_fund_reports_asset_category
#    fx_rate_to_base "9.99"
    association :symbol, :factory => :itsf_fund_reports_symbol
#    description "MyString"
#    con_identifier "MyString"
#    security_indentifier "MyString"
#    security_id_type "MyString"
#    cusip "MyString"
#    isin nil
#    underlying_con_identifier "MyString"
#    underlying_symbol nil
#    issuer "MyString"
#    trade_identifier "MyString"
#    report_date "2013-04-25"
#    trade_time "2013-04-25 17:15:46"
#    settle_date_target "2013-04-25"
    association :transaction_type, :factory => :itsf_fund_reports_transaction_type
    association :exchange, :factory => :itsf_fund_reports_exchange
    quantity 1
#    trade_price "9.99"
#    multiplier 1
#    trade_money "9.99"
#    proceeds "9.99"
#    taxes "9.99"
#    ib_commission "9.99"
    association :ib_commission_currency, :factory => :itsf_fund_reports_currency
#    close_price "9.99"
#    open_close_indicator "MyString"
#    notes "MyString"
#    cost "9.99"
#    fifo_pnl_realized "9.99"
#    mtm_pnl "9.99"
#    orig_trade_price "9.99"
#    orig_trade_date "2013-04-25 17:15:46"
#    orig_trade_identifier "MyString"
#    orig_order_identifier "MyString"
#    strike "MyString"
#    expiry "2013-04-25"
#    put_call "MyString"
#    buy_sell "MyString"
    sequence(:ib_order_identifier) { |i| i.to_s }
    sequence(:ib_exec_identifier) { |i| i.to_s }
#    brokerage_order_ifentifier "MyString"
#    order_reference "MyString"
#    volatility_order_link "MyString"
#    order_placement_time "2013-04-25 17:15:46"
#    clearing_firm_identifier "MyString"
#    exch_order_identifier "MyString"
#    ext_exec_identifier "MyString"
#    order_time "2013-04-25 17:15:46"
#    open_date_time "2013-04-25 17:15:46"
#    holding_period_date_time "2013-04-25 17:15:46"
#    when_realized "2013-04-25 17:15:46"
#    when_reopened "2013-04-25 17:15:46"
#    level_of_detail nil
#    change_in_price "9.99"
#    change_in_quantity 1
#    net_cash "9.99"
    association :order_type, :factory => :itsf_fund_reports_order_type
  end
end
