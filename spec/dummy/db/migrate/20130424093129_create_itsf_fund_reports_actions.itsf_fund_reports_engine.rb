# This migration comes from itsf_fund_reports_engine (originally 4)
class CreateItsfFundReportsActions < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_actions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
