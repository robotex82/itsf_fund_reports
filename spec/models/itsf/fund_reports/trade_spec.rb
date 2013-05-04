require 'spec_helper'

module ITSF::FundReports
  describe Trade do
    describe 'with a winning long trade' do
      before do
        @quantity = 2
        @buy = FactoryGirl.create(:itsf_fund_reports_action_bot)
        @sell = FactoryGirl.create(:itsf_fund_reports_action_sld)
        @account = FactoryGirl.create(:itsf_fund_reports_account, :name => 'DU123456')
        @currency = FactoryGirl.create(:itsf_fund_reports_currency, :name => 'EUR')
        @exchange = FactoryGirl.create(:itsf_fund_reports_exchange, :name => 'DTB')
        @underlying = FactoryGirl.create(:itsf_fund_reports_underlying, :name => 'DAX', :multiplier => 25)

        @open = FactoryGirl.create(
          :itsf_fund_reports_execution,
          :quantity => @quantity,
          :price => 1000,
          :account => @account,
          :action => @buy,
          :currency => @currency,
          :exchange => @exchange,
          :underlying => @underlying
        )
        @close = FactoryGirl.create(
          :itsf_fund_reports_execution,
          :quantity => @quantity,          
          :price => 1100,
          :account => @account,
          :action => @sell,
          :currency => @currency,
          :exchange => @exchange,
          :underlying => @underlying
        )
      end # before

      subject { Trade.new(@open, @close) }

      it 'should calculate the correct p/l in points' do
        subject.pl_in_points.should eq(100)
      end # it

      it 'should calculate the correct p/l' do
        subject.pl.should eq(5000)
      end # it
    end # describe 'with a long trade'

    describe 'public interface' do
      subject do
        @open = FactoryGirl.create(:itsf_fund_reports_execution_sell)
        @close = FactoryGirl.create(:itsf_fund_reports_execution_buy_to_cover)
        Trade.new(@open, @close)
      end # subject
      describe '#closed_at' do
        it 'should respond to #closed_at' do
          subject.should respond_to(:closed_at)
        end # it
      end # describe '#closed_at'

      describe '#opened_at' do
        it 'should respond to #opened_at' do
          subject.should respond_to(:opened_at)
        end # it
      end # describe '#opened_at'
    end # describe 'public interface'
  end # describe Trade
end # module ITSF::FundReports

