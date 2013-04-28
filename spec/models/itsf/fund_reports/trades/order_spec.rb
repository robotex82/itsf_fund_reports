require 'spec_helper'

module ITSF::FundReports
  describe Trades::Order do
    describe 'associations' do
      it { should belong_to :account }
      it { should belong_to :action }
      it { should belong_to :currency }
      it { should belong_to :asset_category }
      it { should belong_to :symbol }
      it { should belong_to :security }
      it { should belong_to :transaction_type }
      it { should belong_to :exchange }
      it { should belong_to :ib_commission_currency }
      it { should belong_to :order_type }
      it { should belong_to :flex_query_run }
    end # describe 'associations'

    describe 'validations' do
      it { should validate_presence_of :account }
      it { should validate_presence_of :action }
      it { should validate_presence_of :asset_category }
      it { should validate_presence_of :currency }
      it { should validate_presence_of :exchange }
      it { should validate_presence_of :ib_commission_currency }
      it { should validate_presence_of :ib_order_identifier }
      # it { should validate_uniqueness_of :ib_order_identifier }
      # it { should validate_presence_of :ib_exec_identifier }
      # it { should validate_uniqueness_of :ib_exec_identifier }
      it { should validate_presence_of :order_type }
      it { should validate_presence_of :quantity }
      it { should validate_presence_of :symbol }
      it { should validate_presence_of :transaction_type }
    end # describe 'validations'
  end # describe Trades::Order
end # module ITSF::FundReports

