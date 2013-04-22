FactoryGirl.define do
  factory :itsf_fund_reports_account, :class => 'ITSF::FundReports::Account' do
    sequence(:name) { |i| "Account ##{i}" }
  end
end

