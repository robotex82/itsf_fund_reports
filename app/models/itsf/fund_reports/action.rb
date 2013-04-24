module ITSF::FundReports
  class Action < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_actions'

    # associations
    has_many :executions

    # attributes
    attr_accessible :description, :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true

    def to_s
      name
    end
  end # class Action < ActiveRecord::Base
end # module ITSF::FundReports

