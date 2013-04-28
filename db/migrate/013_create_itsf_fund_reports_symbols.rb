class CreateItsfFundReportsSymbols < ActiveRecord::Migration
  def change
    create_table :itsf_fund_reports_symbols do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
