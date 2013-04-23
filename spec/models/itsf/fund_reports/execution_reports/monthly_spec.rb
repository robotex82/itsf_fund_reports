require 'spec_helper'

module ITSF::FundReports
  module ExecutionReports
    describe Monthly do
      describe 'with one pair of matching executions' do
        before(:each) do
          @quantity = 1
          @account = FactoryGirl.create(:itsf_fund_reports_account, :name => 'DU123456')
          @currency = FactoryGirl.create(:itsf_fund_reports_currency, :name => 'EUR')
          @exchange = FactoryGirl.create(:itsf_fund_reports_exchange, :name => 'DTB')
          @underlying = FactoryGirl.create(:itsf_fund_reports_underlying, :name => 'DAX')

          @date_range = DateRange.new(7.days.ago, Time.now)
          @executions = []
          @executions << FactoryGirl.create(
            :itsf_fund_reports_execution_sell,
            :price => 1000,
            :account => @account,
            :currency => @currency,
            :exchange => @exchange,
            :underlying => @underlying
          )
          @executions << FactoryGirl.create(
            :itsf_fund_reports_execution_buy_to_cover,
            :price => 900,
            :account => @account,
            :currency => @currency,
            :exchange => @exchange,
            :underlying => @underlying
          )
        end # before

        subject { Monthly.new(@executions, @date_range) }

        it 'should calculate the p/l' do
          subject.pl.should eq(100)
        end # it
      end # describe 'with one pair of matching executions'

      describe 'with two pairs of matching executions' do
        before(:each) do
          @date_range = DateRange.new(7.days.ago, Time.now)
          @executions = []

          quantity = 1
          buy = FactoryGirl.create(:itsf_fund_reports_action_buy)
          sell = FactoryGirl.create(:itsf_fund_reports_action_sell)
          account = FactoryGirl.create(:itsf_fund_reports_account, :name => 'DU123456')
          currency = FactoryGirl.create(:itsf_fund_reports_currency, :name => 'EUR')
          exchange = FactoryGirl.create(:itsf_fund_reports_exchange, :name => 'DTB')
          underlying = FactoryGirl.create(:itsf_fund_reports_underlying, :name => 'DAX')
          @executions << FactoryGirl.create(
            :itsf_fund_reports_execution,
            :price => 1000,
            :account => account,
            :action => sell,
            :currency => currency,
            :exchange => exchange,
            :underlying => underlying
          )
          @executions << FactoryGirl.create(
            :itsf_fund_reports_execution_buy_to_cover,
            :price => 900,
            :account => account,
            :action => buy,
            :currency => currency,
            :exchange => exchange,
            :underlying => underlying
          )

          quantity = 1
          # account = FactoryGirl.create(:itsf_fund_reports_account, :name => 'DU123456')
          currency = FactoryGirl.create(:itsf_fund_reports_currency, :name => 'USD')
          exchange = FactoryGirl.create(:itsf_fund_reports_exchange, :name => 'GLOBEX')
          underlying = FactoryGirl.create(:itsf_fund_reports_underlying, :name => 'ES')
          @executions << FactoryGirl.create(
            :itsf_fund_reports_execution,
            :price => 1000,
            :account => account,
            :action => sell,
            :currency => currency,
            :exchange => exchange,
            :underlying => underlying
          )
          @executions << FactoryGirl.create(
            :itsf_fund_reports_execution_buy_to_cover,
            :price => 900,
            :account => account,
            :action => buy,
            :currency => currency,
            :exchange => exchange,
            :underlying => underlying
          )
        end # before
        subject { Monthly.new(@executions, @date_range) }
        it 'should calculate the p/l' do
          subject.pl.should eq(200)
        end # it

        it 'should match two trades' do
          subject.trades.size.should eq(2)
        end # it

        it 'each trade should consist of the correct open and close execution' do
          subject.trades.each do |trade|
            trade.open_execution.underlying.should eq(trade.close_execution.underlying)
          end
        end # it
      end # describe 'with one pair of matching executions'
    end # describe Monthly
  end # module ExecutionReports
end # module ITSF::FundReports

