require 'spec_helper'

module ITSF::FundReports
  describe ExecutionImport do
    describe 'assets' do
      it { should have_attached_file :asset }
    end # describe 'assets'

    describe 'public interface' do
      describe '#import' do
        describe 'with a valid file' do
          subject { FactoryGirl.create(:itsf_fund_reports_execution_import) }

          it 'should create new executions' do
            subject.import
            ITSF::FundReports::Execution.count.should eq(10)
          end # it
        end # describe 'with a valid file'
      end # describe '#import'
    end # describe 'public interface'

    describe 'validations' do
      it { should validate_attachment_presence(:asset) }
    end # describe 'validations'
  end # describe ExecutionImport
end # module ITSF::FundReports

