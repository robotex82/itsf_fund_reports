# This migration comes from itsf_fund_reports_engine (originally 18)
class CreateItsfFundReportsFlexQueryRecurrences < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_flex_query_recurrences do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
