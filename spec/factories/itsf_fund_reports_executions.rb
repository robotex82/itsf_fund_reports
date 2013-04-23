# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_execution, :class => 'ITSF::FundReports::Execution' do
    quantity 1
    description "Order description"
    price "9.99"
    executed_at 1.day.ago
    sequence(:order_identifier) { |i| "Order identifier ##{i}" }
    order_reference "Order reference"
    association :account, :factory => :itsf_fund_reports_account
    association :action, :factory => :itsf_fund_reports_action
    association :currency, :factory => :itsf_fund_reports_currency
    association :exchange, :factory => :itsf_fund_reports_exchange
    association :underlying, :factory => :itsf_fund_reports_underlying

    factory :itsf_fund_reports_execution_sell do
      executed_at 1.day.ago
      association :action, :factory => :itsf_fund_reports_action_sell
    end # factory

    factory :itsf_fund_reports_execution_buy_to_cover do
      executed_at 1.day.ago - 1.hour
      association :action, :factory => :itsf_fund_reports_action_buy
    end # factory

    factory :itsf_fund_reports_execution_buy do
      executed_at 1.day.ago
      association :action, :factory => :itsf_fund_reports_action_buy
    end # factory
  end # factory
end # FactoryGirl.define
