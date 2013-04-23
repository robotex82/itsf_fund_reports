require 'spec_helper'

module ITSF::FundReports
  describe Underlying do
    describe 'validations' do
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of :name }
      it { should validate_presence_of :multiplier }
    end # describe 'validations'
  end # describe Underlying
end # module ITSF::FundReports

