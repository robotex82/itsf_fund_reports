# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_security, :class => 'ITSF::FundReports::Security' do
    sequence(:name) { |i| "Security ##{i}" }
    sequence(:isin) { |i| "Security ISIN ##{i}" }    
  end
end
