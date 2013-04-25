module ITSF::FundReports
  class OrderType < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_order_types'

    # associations
    has_many :trades, :class_name => Trades::Trade

    # attributes
    attr_accessible :description,
                    :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class OrderType < ActiveRecord::Base
end # module ITSF::FundReports
