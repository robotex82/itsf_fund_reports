# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_transaction_type, :class => 'ITSF::FundReports::TransactionType' do
    sequence(:name) { |i| "Transation Type ##{i}" }
  end
end
