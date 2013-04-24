# This migration comes from itsf_fund_reports_engine (originally 7)
class CreateItsfFundReportsExecutionImports < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_execution_imports do |t|
      t.date :day
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.timestamp :asset_updated_at

      t.timestamps
    end
  end
end
