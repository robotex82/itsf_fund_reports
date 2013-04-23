module ITSF::FundReports
  class Execution < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_executions'

    # associations
    belongs_to :account
    belongs_to :action
    belongs_to :currency
    belongs_to :exchange
    belongs_to :underlying

    # attributes
    attr_accessible :account_id,
                    :action_id,
                    :currency_id,
                    :description,
                    :exchange_id,
                    :executed_at,
                    :order_identifier,
                    :order_reference,
                    :price,
                    :quantity,
                    :underlying_id

    # default scope
    default_scope :order => :executed_at

    # validations
    validates :account_id, :presence => true
    validates :action_id, :presence => true
    validates :currency_id, :presence => true
    validates :exchange_id, :presence => true
    validates :executed_at, :presence => true
    validates :order_identifier, :presence => true,
                                 :uniqueness => true
    validates :price, :presence => true
    validates :quantity, :presence => true
    validates :underlying_id, :presence => true

    def self.executed_between(start_date, end_date)
      where("executed_at >= ? and executed_at < ?", start_date, end_date)
    end

    def action_name
      action.name
    end

    def buy?
      action_name == 'BOT'
    end # def

    def sell?
      action_name == 'SLD'
    end # def
  end # class Execution < ActiveRecord::Base
end # module ITSF::FundReports

