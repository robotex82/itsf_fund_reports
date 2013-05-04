# This migration comes from itsf_fund_reports_engine (originally 8)
class CreateItsfFundReportsFlexQueries < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_flex_queries do |t|
      t.string :query_identifier
      t.string :format
      t.text :description

      # associations
      t.references :account
      t.references :recurrence

      t.timestamps
    end
    add_index :itsf_fund_reports_flex_queries, :account_id
    add_index :itsf_fund_reports_flex_queries, :recurrence_id
  end
end
