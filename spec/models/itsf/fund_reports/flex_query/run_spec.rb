require 'spec_helper'

module ITSF::FundReports
  describe FlexQuery::Run do
    describe 'associations' do
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
