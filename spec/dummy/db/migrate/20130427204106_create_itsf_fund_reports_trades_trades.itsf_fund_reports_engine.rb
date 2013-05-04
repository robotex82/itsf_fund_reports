# This migration comes from itsf_fund_reports_engine (originally 10)
class CreateItsfFundReportsTradesTrades < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_trades_trades do |t|
      t.references :account
      t.references :action
      t.references :currency
      t.references :asset_category
      t.decimal :fx_rate_to_base, :precision => 12, :scale => 4
      t.references :symbol
      t.string :description
      t.string :con_identifier
      t.string :security_indentifier
      t.string :security_id_type
      t.string :cusip
      t.references :security
      t.string :underlying_con_identifier
      t.references :underlying_symbol
      t.string :issuer
      t.string :trade_identifier
      t.date :report_date
      t.timestamp :trade_time
      t.date :settle_date_target
      t.references :transaction_type
      t.references :exchange
      t.integer :quantity
      t.decimal :trade_price, :precision => 12, :scale => 4
      t.integer :multiplier
      t.decimal :trade_money, :precision => 12, :scale => 4
      t.decimal :proceeds, :precision => 12, :scale => 4
      t.decimal :taxes, :precision => 12, :scale => 4
      t.decimal :ib_commission, :precision => 12, :scale => 4
      t.references :ib_commission_currency
      t.decimal :close_price, :precision => 12, :scale => 4
      t.string :open_close_indicator
      t.string :notes
      t.decimal :cost, :precision => 12, :scale => 4
      t.decimal :fifo_pnl_realized, :precision => 12, :scale => 4
      t.decimal :mtm_pnl, :precision => 12, :scale => 4
      t.decimal :orig_trade_price, :precision => 12, :scale => 4
      t.timestamp :orig_trade_date
      t.string :orig_trade_identifier
      t.string :orig_order_identifier
      t.string :strike
      t.date :expiry
      t.string :put_call
      t.string :ib_order_identifier
      t.string :ib_exec_identifier
      t.string :brokerage_order_ifentifier
      t.string :order_reference
      t.string :volatility_order_link
      t.timestamp :order_placement_time
      t.string :clearing_firm_identifier
      t.string :exch_order_identifier
      t.string :ext_exec_identifier
      t.timestamp :order_time
      t.timestamp :open_date_time
      t.timestamp :holding_period_date_time
      t.timestamp :when_realized
      t.timestamp :when_reopened
      t.string :level_of_detail
      t.decimal :change_in_price, :precision => 12, :scale => 4
      t.integer :change_in_quantity
      t.decimal :net_cash, :precision => 12, :scale => 4
      t.references :order
      t.references :order_type
      t.references :flex_query_run
      t.references :trade_group

      t.timestamps
    end
    add_index :itsf_fund_reports_trades_trades, :account_id
    add_index :itsf_fund_reports_trades_trades, :action_id
    add_index :itsf_fund_reports_trades_trades, :currency_id
    add_index :itsf_fund_reports_trades_trades, :asset_category_id
    add_index :itsf_fund_reports_trades_trades, :symbol_id
    add_index :itsf_fund_reports_trades_trades, :security_id
    add_index :itsf_fund_reports_trades_trades, :underlying_symbol_id
    add_index :itsf_fund_reports_trades_trades, :transaction_type_id
    add_index :itsf_fund_reports_trades_trades, :exchange_id
    add_index :itsf_fund_reports_trades_trades, :ib_commission_currency_id, :name => 'index_itsf_fund_reports_trades_trades_on_ib_comm_currency_id'
    add_index :itsf_fund_reports_trades_trades, :order_id
    add_index :itsf_fund_reports_trades_trades, :order_type_id
    add_index :itsf_fund_reports_trades_trades, :flex_query_run_id
    add_index :itsf_fund_reports_trades_trades, :trade_group_id
  end
end

