module ITSF::FundReports
  class FlexQuery::Run < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_flex_query_runs'

    # associations
    belongs_to :flex_query

    # attributes
    attr_accessible :asset

    # paperclip
    has_attached_file :asset

    # validations
    validates_attachment_presence :asset
  end
end
