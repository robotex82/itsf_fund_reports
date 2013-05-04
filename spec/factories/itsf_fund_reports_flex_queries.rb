# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :itsf_fund_reports_flex_query, :class => 'ITSF::FundReports::FlexQuery' do
    sequence(:query_identifier) { |i| "89426" }
    format "xml"
    association :account, :factory => :itsf_fund_reports_account

    factory :itsf_fund_reports_flex_query_with_runs do
      association :account, :factory => :itsf_fund_reports_account
      after_build do |flex_query|
        flex_query.runs << FactoryGirl.build_list(:itsf_fund_reports_flex_query_run, 2, :flex_query => flex_query)
      end

      after_create do |flex_query|
        flex_query.runs.map(&:save!)
      end
    end
  end
end
