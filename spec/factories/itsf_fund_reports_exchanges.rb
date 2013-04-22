# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_exchange, :class => 'ITSF::FundReports::Exchange' do
    sequence(:name) { |i| "Exchange ##{i}" }
  end
end
