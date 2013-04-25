require 'spec_helper'

module ITSF::FundReports
  describe FlexQuery do
    describe 'associations' do
      it { should belong_to :account }
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

