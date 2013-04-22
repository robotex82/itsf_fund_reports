require 'spec_helper'

module ITSF::FundReports
  describe Currency do
    describe 'validations' do
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of :name }
    end # describe 'validations'
  end # describe Currency
end # module ITSF::FundReports

