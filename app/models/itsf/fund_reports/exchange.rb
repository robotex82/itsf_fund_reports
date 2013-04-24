module ITSF::FundReports
  class Exchange < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_exchanges'

    # associations
    has_many :executions

    # attributes
    attr_accessible :description, :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class Exchange < ActiveRecord::Base
end # module ITSF::FundReports

