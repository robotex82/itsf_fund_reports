# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_order_type, :class => 'ITSF::FundReports::OrderType' do
    sequence(:name) { |i| "Order Type ##{i}" }
  end
end
