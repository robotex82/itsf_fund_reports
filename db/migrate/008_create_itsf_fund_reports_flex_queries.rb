class CreateItsfFundReportsFlexQueries < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_flex_queries do |t|
      t.string :query_identifier
      t.string :format

      # associations
      t.references :account

      t.timestamps
    end
  end
end
