module ITSF::FundReports
  class FlexQuery::Recurrence < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_flex_query_recurrences'

    # associations
    has_many :flex_queries

    # attributes
    attr_accessible :description,
                    :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true
  end # class FlexQuery::Recurrence
end # module ITSF::FundReports
