# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_flex_query_recurrence, :class => 'ITSF::FundReports::FlexQuery::Recurrence' do
    sequence(:name) { |i| "FlexQuery Recurrence ##{i}" }
  end
end
