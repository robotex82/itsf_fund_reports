module ITSF::FundReports
  class TransactionType < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_transaction_types'

    # associations
    has_many :trades, :class_name => Trades::Trade

    # attributes
    attr_accessible :description,
                    :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class TransactionType < ActiveRecord::Base
end # module ITSF::FundReports
