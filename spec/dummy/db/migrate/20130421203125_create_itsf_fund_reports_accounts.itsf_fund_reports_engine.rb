# This migration comes from itsf_fund_reports_engine (originally 1)
class CreateItsfFundReportsAccounts < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_accounts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

