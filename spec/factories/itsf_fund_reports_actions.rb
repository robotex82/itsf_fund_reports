# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :itsf_fund_reports_action, :class => 'ITSF::FundReports::Action' do
    sequence(:name) { |i| "Exchange ##{i}" }

    factory :itsf_fund_reports_action_buy do
      name 'BUY'
    end

    factory :itsf_fund_reports_action_sell do
      name 'SELL'
    end

    factory :itsf_fund_reports_action_bot do
      name 'BOT'
    end

    factory :itsf_fund_reports_action_sld do
      name 'SLD'
    end
  end
end
