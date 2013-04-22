module ITSF::FundReports
  class Action < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_actions'

    # attributes
    attr_accessible :description, :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class Action < ActiveRecord::Base
end # module ITSF::FundReports

