# This migration comes from itsf_fund_reports_engine (originally 17)
class CreateItsfFundReportsTradeGroups < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_trade_groups do |t|
      t.references :symbol
      t.references :underlying_symbol
      t.timestamp :first_open_time
      t.timestamp :last_close_time
      t.decimal :pnl_points, :precision => 12, :scale => 4
      t.integer :multiplier
      t.text :description

      t.timestamps
    end
    add_index :itsf_fund_reports_trade_groups, :symbol_id
    add_index :itsf_fund_reports_trade_groups, :underlying_symbol_id
  end
end

