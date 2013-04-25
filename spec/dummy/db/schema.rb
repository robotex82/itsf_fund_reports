# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130425170018) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "itsf_fund_reports_accounts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "itsf_fund_reports_actions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "itsf_fund_reports_asset_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "itsf_fund_reports_currencies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "itsf_fund_reports_exchanges", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "itsf_fund_reports_execution_imports", :force => true do |t|
    t.date     "day"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "itsf_fund_reports_executions", :force => true do |t|
    t.integer  "quantity"
    t.string   "description"
    t.decimal  "price",               :precision => 12, :scale => 4
    t.datetime "executed_at"
    t.string   "order_identifier"
    t.string   "order_reference"
    t.integer  "account_id"
    t.integer  "action_id"
    t.integer  "currency_id"
    t.integer  "exchange_id"
    t.integer  "execution_import_id"
    t.integer  "underlying_id"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "itsf_fund_reports_executions", ["account_id"], :name => "index_itsf_fund_reports_executions_on_account_id"
  add_index "itsf_fund_reports_executions", ["action_id"], :name => "index_itsf_fund_reports_executions_on_action_id"
  add_index "itsf_fund_reports_executions", ["currency_id"], :name => "index_itsf_fund_reports_executions_on_currency_id"
  add_index "itsf_fund_reports_executions", ["exchange_id"], :name => "index_itsf_fund_reports_executions_on_exchange_id"
  add_index "itsf_fund_reports_executions", ["execution_import_id"], :name => "index_itsf_fund_reports_executions_on_execution_import_id"
  add_index "itsf_fund_reports_executions", ["underlying_id"], :name => "index_itsf_fund_reports_executions_on_underlying_id"

  create_table "itsf_fund_reports_flex_queries", :force => true do |t|
    t.string   "query_identifier"
    t.string   "format"
    t.integer  "account_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "itsf_fund_reports_flex_query_runs", :force => true do |t|
    t.string   "asset_file_name"
    t.integer  "asset_file_size"
    t.string   "asset_content_type"
    t.datetime "asset_updated_at"
    t.integer  "flex_query_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "itsf_fund_reports_order_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "itsf_fund_reports_symbols", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "itsf_fund_reports_trades_trades", :force => true do |t|
    t.integer  "account_id"
    t.integer  "currency_id"
    t.integer  "asset_category_id"
    t.decimal  "fx_rate_to_base"
    t.integer  "symbol_id"
    t.string   "description"
    t.string   "con_identifier"
    t.string   "security_indentifier"
    t.string   "security_id_type"
    t.string   "cusip"
    t.integer  "isin_id"
    t.string   "underlying_con_identifier"
    t.integer  "underlying_symbol_id"
    t.string   "issuer"
    t.string   "trade_identifier"
    t.date     "report_date"
    t.datetime "trade_time"
    t.date     "settle_date_target"
    t.integer  "transaction_type_id"
    t.integer  "exchange_id"
    t.integer  "quantity"
    t.decimal  "trade_price"
    t.integer  "multiplier"
    t.decimal  "trade_money"
    t.decimal  "proceeds"
    t.decimal  "taxes"
    t.decimal  "ib_commission"
    t.integer  "ib_commission_currency_id"
    t.decimal  "close_price"
    t.string   "open_close_indicator"
    t.string   "notes"
    t.decimal  "cost"
    t.decimal  "fifo_pnl_realized"
    t.decimal  "mtm_pnl"
    t.decimal  "orig_trade_price"
    t.datetime "orig_trade_date"
    t.string   "orig_trade_identifier"
    t.string   "orig_order_identifier"
    t.string   "strike"
    t.date     "expiry"
    t.string   "put_call"
    t.string   "buy_sell"
    t.string   "ib_order_identifier"
    t.string   "ib_exec_identifier"
    t.string   "brokerage_order_ifentifier"
    t.string   "order_reference"
    t.string   "volatility_order_link"
    t.datetime "order_placement_time"
    t.string   "clearing_firm_identifier"
    t.string   "exch_order_identifier"
    t.string   "ext_exec_identifier"
    t.datetime "order_time"
    t.datetime "open_date_time"
    t.datetime "holding_period_date_time"
    t.datetime "when_realized"
    t.datetime "when_reopened"
    t.string   "level_of_detail"
    t.decimal  "change_in_price"
    t.integer  "change_in_quantity"
    t.decimal  "net_cash"
    t.integer  "order_type_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "itsf_fund_reports_trades_trades", ["account_id"], :name => "index_itsf_fund_reports_trades_trades_on_account_id"
  add_index "itsf_fund_reports_trades_trades", ["asset_category_id"], :name => "index_itsf_fund_reports_trades_trades_on_asset_category_id"
  add_index "itsf_fund_reports_trades_trades", ["currency_id"], :name => "index_itsf_fund_reports_trades_trades_on_currency_id"
  add_index "itsf_fund_reports_trades_trades", ["exchange_id"], :name => "index_itsf_fund_reports_trades_trades_on_exchange_id"
  add_index "itsf_fund_reports_trades_trades", ["ib_commission_currency_id"], :name => "index_itsf_fund_reports_trades_trades_on_ib_comm_currency_id"
  add_index "itsf_fund_reports_trades_trades", ["isin_id"], :name => "index_itsf_fund_reports_trades_trades_on_isin_id"
  add_index "itsf_fund_reports_trades_trades", ["order_type_id"], :name => "index_itsf_fund_reports_trades_trades_on_order_type_id"
  add_index "itsf_fund_reports_trades_trades", ["symbol_id"], :name => "index_itsf_fund_reports_trades_trades_on_symbol_id"
  add_index "itsf_fund_reports_trades_trades", ["transaction_type_id"], :name => "index_itsf_fund_reports_trades_trades_on_transaction_type_id"
  add_index "itsf_fund_reports_trades_trades", ["underlying_symbol_id"], :name => "index_itsf_fund_reports_trades_trades_on_underlying_symbol_id"

  create_table "itsf_fund_reports_transaction_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "itsf_fund_reports_underlyings", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "multiplier",  :default => 1
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

end
