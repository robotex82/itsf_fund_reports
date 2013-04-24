# This migration comes from itsf_fund_reports_engine (originally 5)
class CreateItsfFundReportsCurrencies < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_currencies do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
