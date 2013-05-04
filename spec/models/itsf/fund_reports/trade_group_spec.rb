require 'spec_helper'

module ITSF::FundReports
  describe TradeGroup do
    describe 'trade grouping' do
      before do
        @first_open_trade = FactoryGirl.create(:itsf_fund_reports_trades_trade,
          :trade_time  => 1.day.ago,
          :trade_price => 1000,
          :open_close_indicator => 'O',
          :quantity => 2
        )
        @second_open_trade = FactoryGirl.create(:itsf_fund_reports_trades_trade,
          :trade_time  => 1.day.ago + 1.hour,
          :trade_price => 1100,
          :open_close_indicator => 'O',
          :quantity => 2
        )
        @first_close_trade = FactoryGirl.create(:itsf_fund_reports_trades_trade,
          :trade_time  => 1.day.ago + 5.hours,
          :trade_price => 1500,
          :open_close_indicator => 'C',
          :quantity => 2
        )
        @second_close_trade = FactoryGirl.create(:itsf_fund_reports_trades_trade,
          :trade_time  => 1.day.ago + 6.hours,
          :trade_price => 1600,
          :open_close_indicator => 'C',
          :quantity => 2
        )
      end # before

      subject do
        trade_group = FactoryGirl.build(:itsf_fund_reports_trade_group)
        trade_group.trades.delete_all
        trade_group.trades << @first_open_trade
        trade_group.trades << @second_open_trade      
        trade_group.trades << @first_close_trade
        trade_group.trades << @second_close_trade    
        trade_group.save!
        trade_group
      end # subject

      describe 'first open calculation' do
        it 'should have the correct first open time' do
          subject.first_open_time.should eq(@first_open_trade.trade_time)
        end # it
      end # describe 'first open calculation'

      describe 'last close calculation' do
        it 'should have the correct last close time' do
          subject.last_close_time.should eq(@second_close_trade.trade_time)
        end # it
      end # describe 'last close calculation'

      describe 'p/l points calculation' do
        it 'should calculate the correct p/l in points'
#        it 'should calculate the correct p/l in points' do
#          subject.pnl_points.should eq(2000)
#        end # it
      end # describe 'p/l points calculation'
    end # describe 'trade grouping'

    describe 'associations' do
      it { should belong_to :symbol }
      it { should belong_to :underlying_symbol }
      it { should have_many :trades }
    end # describe 'associations'

    describe 'validations' do
      it 'should validate the equality of open and close quantities' do
      end # it

      it 'should validate the equality of multipliers' do
      end # it

      it 'should validate the equality trade symbols' do
      end # it
#      it { should validate_presence_of :first_open_time }
#      it { should validate_presence_of :last_close_time }
#      it { should validate_presence_of :multiplier }
#      # it { should validate_presence_of :pnl_points }
#      it { should validate_presence_of :symbol }
#      it { should validate_presence_of :underlying_symbol }
    end # describe 'validations'
  end # describe TradeGroup
end # module ITSF::FundReports

