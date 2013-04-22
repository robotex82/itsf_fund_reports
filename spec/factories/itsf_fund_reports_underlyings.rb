# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_underlying, :class => 'ITSF::FundReports::Underlying' do
    sequence(:name) { |i| "Underlying ##{i}" }
  end
end
