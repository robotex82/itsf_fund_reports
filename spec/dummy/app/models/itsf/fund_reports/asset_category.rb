module ITSF::FundReports
  class AssetCategory < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_asset_categories'

    # associations
    has_many :trades, :class_name => Trades::Trade

    # attributes
    attr_accessible :description,
                    :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class AssetCategory < ActiveRecord::Base
end # module ITSF::FundReports
