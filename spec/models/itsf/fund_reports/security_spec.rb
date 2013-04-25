require 'spec_helper'

module ITSF::FundReports
  describe Security do
    describe 'associations' do
      it { should have_many :trades }
    end # describe 'associations'

    describe 'validations' do
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of :name }
      it { should validate_presence_of :isin }
      it { should validate_uniqueness_of :isin }
    end # describe 'validations'
  end # describe Security
end # module ITSF::FundReports

