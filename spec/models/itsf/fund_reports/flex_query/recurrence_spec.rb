require 'spec_helper'

module ITSF::FundReports
  describe FlexQuery::Recurrence do
    describe 'associations' do
      it { should have_many :flex_queries }
    end # describe 'associations'

    describe 'validations' do
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of :name }
    end # describe 'validations'
  end # describe FlexQuery::Run
end # module ITSF::FundReports

