# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :itsf_fund_reports_flex_query, :class => 'ITSF::FundReports::FlexQuery' do
    sequence(:query_identifier) { |i| "89426" }
    format "xml"
    association :account, :factory => :itsf_fund_reports_account
  end
end
