module ITSF::FundReports
  class Account < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_accounts'

    # attributes
    attr_accessible :description, :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class Account
end # module ITSF::FundReports
