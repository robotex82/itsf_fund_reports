# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :itsf_fund_reports_trade_group, :class => 'ITSF::FundReports::TradeGroup' do
    association :symbol, :factory => :itsf_fund_reports_symbol
    association :underlying_symbol, :factory => :itsf_fund_reports_underlying

    after_build do |trade_group|
      trade_group.trades << FactoryGirl.build_list(:itsf_fund_reports_trades_trade, 2, :trade_group => trade_group)
    end

    after_create do |trade_group|
      trade_group.trades.map(&:save!)
    end
  end
end
