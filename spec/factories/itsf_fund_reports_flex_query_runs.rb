# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :itsf_fund_reports_flex_query_run, :class => 'ITSF::FundReports::FlexQuery::Run' do
    association :flex_query, :factory => :itsf_fund_reports_flex_query
    asset File.open(File.join(Rails.root, "spec/files", "itsf/fund_reports", "flex_query/run", "asset.xml"))
  end
end
