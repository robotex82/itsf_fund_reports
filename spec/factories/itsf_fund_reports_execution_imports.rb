# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_execution_import, :class => 'ITSF::FundReports::ExecutionImport' do
    asset File.open(File.join(Rails.root, 'spec/files', 'itsf/fund_reports', 'execution_import', 'asset.csv'))
  end
end
