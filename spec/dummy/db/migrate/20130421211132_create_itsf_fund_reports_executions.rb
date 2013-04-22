class CreateItsfFundReportsExecutions < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_executions do |t|
      t.integer :quantity
      t.string :description
      t.decimal :price, :precision => 12, :scale => 4
      t.timestamp :executed_at
      t.string :order_identifier
      t.string :order_reference

      # associations
      t.references :account
      t.references :action
      t.references :currency
      t.references :exchange
      t.references :underlying

      t.timestamps
    end
    add_index :itsf_fund_reports_executions, :account_id
    add_index :itsf_fund_reports_executions, :action_id
    add_index :itsf_fund_reports_executions, :currency_id
    add_index :itsf_fund_reports_executions, :exchange_id
    add_index :itsf_fund_reports_executions, :underlying_id
  end
end
