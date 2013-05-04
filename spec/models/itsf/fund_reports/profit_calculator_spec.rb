#require 'spec_helper'

#module ITSF::FundReports
#  describe ProfitCalculator do
#    describe '#merged_buy_price' do
#      before do
#        @buy = [
#          { :price => 1000.00, :quantity => 2 },
#          { :price => 1100.00, :quantity => 2 }
#        ]
#        @sell = [
#          { :price => 1200.00, :quantity => -1 },
#          { :price => 1300.00, :quantity => -3 }
#        ]
#      end # before

#      subject { ProfitCalculator.new(@buy, @sell) }

#      it { should respond_to :merged_buy_price }

#      it 'should return the correct value' do
#        subject.merged_buy_price.should eq(1050.00)
#      end # it
#    end # describe '#merged_buy_price'

#    describe '#merged_sell_price' do
#      before do
#        @buy = [
#          { :price => 1000.00, :quantity => 2 },
#          { :price => 1100.00, :quantity => 2 }
#        ]
#        @sell = [
#          { :price => 1200.00, :quantity => -1 },
#          { :price => 1300.00, :quantity => -3 }
#        ]
#      end # before

#      subject { ProfitCalculator.new(@buy, @sell) }

#      it { should respond_to :merged_sell_price }

#      it 'should return the correct value' do
#        subject.merged_sell_price.should eq(1275.00)
#      end # it
#    end # describe '#merged_sell_price'

#    describe '#points' do
#      it { should respond_to :points }

#      describe 'calculation for a winning long trade' do
#        before do
#          @buy = [
#            { :trade_time => 1.day.ago, :price => 1000.00, :quantity => 2 },
#            { :trade_time => 1.day.ago + 1.hour, :price => 1100.00, :quantity => 2 }
#          ]
#          @sell = [
#            { :trade_time => 1.day.ago + 2.hours, :price => 1200.00, :quantity => -1 },
#            { :trade_time => 1.day.ago + 3.hours, :price => 1300.00, :quantity => -3 }
#          ]
#        end # before

#        subject { ProfitCalculator.new(@buy, @sell) }

#        it 'should return the correct value' do
#          subject.points.should eq(900)
#        end # it
#      end # describe 'calculation for a winning long trade'

#      describe 'calculation for a winning short trade' do
#        before do
#          @buy = [
#            { :trade_time => 1.day.ago, :price => 1200.00, :quantity => 1 },
#            { :trade_time => 1.day.ago + 1.hour, :price => 1300.00, :quantity => 3 }
#          ]
#          @sell = [
#            { :trade_time => 1.day.ago + 2.hours, :price => 1000.00, :quantity => -2 },
#            { :trade_time => 1.day.ago + 3.hours, :price => 1100.00, :quantity => -2 }
#          ]
#        end # before

#        subject { ProfitCalculator.new(@buy, @sell) }

#        it 'should return the correct value' do
#          subject.points.should eq(900)
#        end # it
#      end # describe 'calculation for a winning short trade'
#    end # describe '#points'
#  end # describe ProfitCalculator
#end # module ITSF::FundReports

