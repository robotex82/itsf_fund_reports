# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_execution, :class => 'ITSF::FundReports::Execution' do
    quantity 1
    description "Order description"
    price "9.99"
    executed_at 1.day.ago
    order_identifier "Order identifier"
    order_reference "Order reference"
    association :account, :factory => :itsf_fund_reports_account
    association :action, :factory => :itsf_fund_reports_action
    association :currency, :factory => :itsf_fund_reports_currency
    association :exchange, :factory => :itsf_fund_reports_exchange
    association :underlying, :factory => :itsf_fund_reports_underlying
  end
end
