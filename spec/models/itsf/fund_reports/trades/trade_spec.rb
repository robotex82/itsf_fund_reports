require 'spec_helper'

module ITSF::FundReports
  describe Trades::Trade do
    describe 'associations' do
      it { should belong_to :account }
      it { should belong_to :currency }
      it { should belong_to :asset_category }
      it { should belong_to :symbol }
      it { should belong_to :isin }
      it { should belong_to :transaction_type }
      it { should belong_to :exchange }
      it { should belong_to :ib_commission_currency }
      it { should belong_to :order_type }
    end # describe 'associations'

    describe 'validations' do
      it { should validate_presence_of :account }
      it { should validate_presence_of :currency }
      it { should validate_presence_of :asset_category }
      it { should validate_presence_of :symbol }
      it { should validate_presence_of :transaction_type }
      it { should validate_presence_of :exchange }
      it { should validate_presence_of :ib_commission_currency }
      it { should validate_presence_of :order_type }
    end # describe 'validations'
  end # describe Trades::Trade
end # module ITSF::FundReports
