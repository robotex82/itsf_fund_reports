module ITSF::FundReports
  class Symbol < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_symbols'

    # associations
    has_many :trades, :class_name => Trades::Trade

    # attributes
    attr_accessible :description,
                    :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class Symbol < ActiveRecord::Base
end # module ITSF::FundReports
