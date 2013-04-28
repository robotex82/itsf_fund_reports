require 'spec_helper'

module ITSF::FundReports
  describe FlexQuery::Run do
    describe '#import' do
      it { should respond_to :import }

      describe 'with a valid file' do
        subject { FactoryGirl.create(:itsf_fund_reports_flex_query_run) }

        it 'should create orders' do
          subject.import
          Trades::Order.count.should eq(2)
        end # it

        it 'should create orders that belong to itself' do
          subject.import
          subject.orders.count.should eq(2)
        end # it

        it 'should create trades' do
          subject.import
          Trades::Trade.count.should eq(2)
        end # it

        it 'should create trades that belong to itself' do
          subject.import
          subject.trades.count.should eq(2)
        end # it
      end # describe 'with a valid file'
    end # describe '#import'

    describe 'associations' do
      it { should have_many :orders }
      it { should have_many :trades }
      it { should belong_to :flex_query }
    end # describe 'associations'

    describe 'assets' do
      it { should have_attached_file :asset }
    end # describe 'assets'

    describe 'validations' do
      it { should validate_attachment_presence(:asset) }
    end # describe 'validations'
  end # describe FlexQuery::Run
end # module ITSF::FundReports
