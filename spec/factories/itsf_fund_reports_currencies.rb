# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_currency, :class => 'ITSF::FundReports::Currency' do
    sequence(:name) { |i| "Currency ##{i}" }
  end
end
