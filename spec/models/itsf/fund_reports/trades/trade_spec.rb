require 'spec_helper'

module ITSF::FundReports
  describe Trades::Trade do
    describe '#find_source_order' do
      it { should respond_to :discover_source_order }

      describe 'with a suiting order' do
        before do
          @source_order = FactoryGirl.create(:itsf_fund_reports_trades_order, :ib_order_identifier => '123456789')
        end # before

        subject { FactoryGirl.build(:itsf_fund_reports_trades_trade, :ib_order_identifier => '123456789', :order => nil) }

        it 'should discover the source order' do
          subject.discover_source_order
          subject.order.should eq(@source_order)
        end # it
      end # describe 'with a suiting order'
    end # describe '#find_source_order'

    describe 'associations' do
      it { should belong_to :account }
      it { should belong_to :action }
      it { should belong_to :currency }
      it { should belong_to :asset_category }
      it { should belong_to :symbol }
      it { should belong_to :security }
      it { should belong_to :transaction_type }
      it { should belong_to :exchange }
      it { should belong_to :ib_commission_currency }
      it { should belong_to :order }      
      it { should belong_to :order_type }
      it { should belong_to :flex_query_run }
    end # describe 'associations'

    describe 'validations' do
      it { should validate_presence_of :account }
      it { should validate_presence_of :action }
      it { should validate_presence_of :asset_category }
      it { should validate_presence_of :currency }
      it { should validate_presence_of :exchange }
      it { should validate_presence_of :ib_commission_currency }
      it { should validate_presence_of :ib_order_identifier }
      # it { should validate_uniqueness_of :ib_order_identifier }
      # it { should validate_presence_of :ib_exec_identifier }
      # it { should validate_uniqueness_of :ib_exec_identifier }
#      it { should validate_presence_of :order }
      it { should validate_presence_of :order_type }
      it { should validate_presence_of :quantity }
      it { should validate_presence_of :symbol }
      it { should validate_presence_of :transaction_type }
    end # describe 'validations'
  end # describe Trades::Trade
end # module ITSF::FundReports

