require 'spec_helper'

module ITSF::FundReports
  describe Execution do
    describe 'public interface' do
      describe '#buy?' do
        describe 'for a SLD (short) trade' do
          subject { FactoryGirl.create(:itsf_fund_reports_execution_sell) }
          its(:buy?) { should eq(false) }
        end # describe 'for a SLD (short) trade'

        describe 'for a BOT (long) trade' do
          subject { FactoryGirl.create(:itsf_fund_reports_execution_buy) }
          its(:buy?) { should eq(true) }
        end # describe 'for a BOT (long) trade'
      end # describe '#buy?'

      describe '#sell?' do
        describe 'for a SLD (short) trade' do
          subject { FactoryGirl.create(:itsf_fund_reports_execution_sell) }
          its(:sell?) { should eq(true) }
        end # describe 'for a SLD (short) trade'

        describe 'for a BOT (long) trade' do
          subject { FactoryGirl.create(:itsf_fund_reports_execution_buy) }
          its(:sell?) { should eq(false) }
        end # describe 'for a BOT (long) trade'
      end # describe '#sell?'
    end # describe

    describe 'validations' do
      it { should validate_presence_of :account_id }
      it { should validate_presence_of :action_id }
      it { should validate_presence_of :currency_id }
      it { should validate_presence_of :exchange_id }
      it { should validate_presence_of :executed_at }
      it { should validate_presence_of :order_identifier }
      it { should validate_uniqueness_of :order_identifier }
      it { should validate_presence_of :price }
      it { should validate_presence_of :quantity }
      it { should validate_presence_of :underlying_id }
    end # describe 'validations'
  end # describe Execution
end # module ITSF::FundReports

