class CreateItsfFundReportsSecurities < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_securities do |t|
      t.string :name
      t.text :description
      t.string :isin

      t.timestamps
    end
  end
end
