module ITSF::FundReports
  class Account < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_accounts'

    # associations
    has_many :executions
    has_many :flex_queries
    has_many :trades, :class_name => Trades::Trade,
                      :dependent => :destroy,
                      :foreign_key => 'flex_query_run_id'

    # attributes
    attr_accessible :description, :name

    # validations
    validates :name, :presence => true,
                     :uniqueness => true

    def to_s
      if description.blank?
        name
      else
        description
      end
    end # def

    def trade_count
      trades.count
    end # def
  end # class Account
end # module ITSF::FundReports
