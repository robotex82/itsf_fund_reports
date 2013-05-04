# This migration comes from itsf_fund_reports_engine (originally 9)
class CreateItsfFundReportsFlexQueryRuns < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_flex_query_runs do |t|
      t.timestamp :imported_at

      # paperclip
      t.string :asset_file_name
      t.integer :asset_file_size
      t.string :asset_content_type
      t.timestamp :asset_updated_at

      # associations
      t.references :flex_query

      t.timestamps
    end
  end
end
