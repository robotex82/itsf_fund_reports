module ITSF::FundReports
  class Currency < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_currencies'

    # attributes
    attr_accessible :description, :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class Currency < ActiveRecord::Base
end # module ITSF::FundReports

