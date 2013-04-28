# This migration comes from itsf_fund_reports_engine (originally 11)
class CreateItsfFundReportsAssetCategories < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_asset_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
