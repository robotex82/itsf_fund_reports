# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_symbol, :class => 'ITSF::FundReports::Symbol' do
    sequence(:name) { |i| "Symbol ##{i}" }
  end
end
