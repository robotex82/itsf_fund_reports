require 'spec_helper'

module ITSF::FundReports
  describe OrderType do
    describe 'associations' do
      it { should have_many :trades }
    end # describe 'associations'

    describe 'validations' do
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of :name }
    end # describe 'validations'
  end # describe OrderType
end # module ITSF::FundReports

