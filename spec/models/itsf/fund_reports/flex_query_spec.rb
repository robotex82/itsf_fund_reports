require 'spec_helper'

module ITSF::FundReports
  describe FlexQuery do
    describe '#daily_pending' do
      before do
        @daily_recurrence = FactoryGirl.create(:itsf_fund_reports_flex_query_recurrence, :name => 'daily')
        @weekly_recurrence = FactoryGirl.create(:itsf_fund_reports_flex_query_recurrence, :name => 'weekly')
        @daily_pending_query = FactoryGirl.create(:itsf_fund_reports_flex_query, :recurrence => @daily_recurrence)
        @daily_executed_query = FactoryGirl.create(:itsf_fund_reports_flex_query_with_runs, :recurrence => @daily_recurrence)
        @weekly_pending_query = FactoryGirl.create(:itsf_fund_reports_flex_query, :recurrence => @weekly_recurrence)
      end # before

      subject { FlexQuery.daily_pending.all }

      it 'should include flex queries that have the recurrence daily and no runs' do
        subject.should include(@daily_pending_query)
      end # it

      it 'should not include flex queries that have the recurrence daily and one or more runs' do
        subject.should_not include(@daily_executed_query)
      end # it

      it 'should not include flex queries that have a recurrence other than daily' do
        subject.should_not include(@weekly_executed_query)
        subject.should_not include(@weekly_pending_query)
      end # it
    end # describe '#pending'

    describe 'associations' do
      it { should belong_to :account }
      it { should belong_to :recurrence }
      it { should have_many :runs }
    end # describe 'associations'

    describe 'public interface' do
      describe '#account_name' do
        it { should respond_to(:account_name) }
      end

      describe '#run' do
        subject { FactoryGirl.create(:itsf_fund_reports_flex_query) }

        it { should respond_to(:run) }

        it 'should create a new FlexQuery::Run'
#        it 'should create a new FlexQuery::Run' do
#          # Stub account name to return a valid entry from the config file
#          subject.stub(:account_name).and_return('test_account')
#          subject.run
#          subject.runs.count.should eq(1)
#        end # it
      end # describe '#run'
    end # describe 'public interface'

    describe 'validations' do
      it { should validate_presence_of :account }
      it { should validate_presence_of :query_identifier }
      it { should validate_uniqueness_of(:query_identifier).scoped_to(:account_id)  }
      it { should validate_presence_of :format }
      it { should ensure_inclusion_of(:format).in_array(ITSF::FundReports::Configuration.allowed_flex_query_formats.map(&:to_s))  }
    end # describe 'validations'
  end # describe FlexQuery
end # module ITSF::FundReports

