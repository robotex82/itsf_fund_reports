require 'spec_helper'

module ITSF::FundReports
  describe Execution do
    describe 'validations' do
      it { should validate_presence_of :account_id }
      it { should validate_presence_of :action_id }
      it { should validate_presence_of :currency_id }
      it { should validate_presence_of :exchange_id }
      it { should validate_presence_of :executed_at }
      it { should validate_presence_of :order_identifier }
      it { should validate_uniqueness_of :order_identifier }
      it { should validate_presence_of :price }
      it { should validate_presence_of :quantity }
      it { should validate_presence_of :underlying_id }
    end # describe 'validations'
  end # describe Execution
end # module ITSF::FundReports

