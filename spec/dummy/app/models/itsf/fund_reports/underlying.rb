module ITSF::FundReports
  class Underlying < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_underlyings'

    # attributes
    attr_accessible :description, :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class Underlying < ActiveRecord::Base
end # module ITSF::FundReports

