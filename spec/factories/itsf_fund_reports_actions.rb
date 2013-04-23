# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_action, :class => 'ITSF::FundReports::Action' do
    sequence(:name) { |i| "Exchange ##{i}" }

    factory :itsf_fund_reports_action_buy do
      name 'BOT'
    end

    factory :itsf_fund_reports_action_sell do
      name 'SLD'
    end
  end
end
