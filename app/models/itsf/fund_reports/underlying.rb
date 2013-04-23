module ITSF::FundReports
  class Underlying < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_underlyings'

    # attributes
    attr_accessible :description,
                    :multiplier,
                    :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
    validates :multiplier, :presence => true

    def to_s
      name
    end
  end # class Underlying < ActiveRecord::Base
end # module ITSF::FundReports

