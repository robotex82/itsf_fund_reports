# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_asset_category, :class => 'ITSF::FundReports::AssetCategory' do
    sequence(:name) { |i| "Asset Category ##{i}" }
  end
end
