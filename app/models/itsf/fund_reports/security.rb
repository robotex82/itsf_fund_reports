module ITSF::FundReports
  class Security < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_securities'

    # associations
    has_many :trades, :class_name => Trades::Trade

    # attributes
    attr_accessible :description,
                    :name,
                    :isin

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
    validates :isin, :presence => true,
                     :uniqueness => true
  end # class Security < ActiveRecord::Base
end # module ITSF::FundReports
