module ITSF::FundReports
  class FlexQuery::Run < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_flex_query_runs'

    # associations
    belongs_to :flex_query
    has_many :orders, :class_name => Trades::Order,
                      :dependent => :destroy,
                      :foreign_key => 'flex_query_run_id'
    has_many :trades, :class_name => Trades::Trade,
                      :dependent => :destroy,
                      :foreign_key => 'flex_query_run_id'

    # attributes
    attr_accessible :asset,
                    :flex_query_id

    # paperclip
    has_attached_file :asset

    # validations
    validates_attachment_presence :asset

    def import
      imported_orders = import_orders
      imported_trades = import_trades
    end # import

    private
    def asset_content
      asset.to_file.read
    end # def

    def extract_orders(parsed_asset_content)
      orders = []
      parsed_asset_content['FlexStatements'].each do |flex_statement|
        flex_statement['FlexStatement'].each do |flex_statement_content|
          flex_statement_content['Trades'].each do |trades_content|
            orders << trades_content['Order'] unless trades_content['Order'].nil?
          end # each
        end # each
      end # each
      return orders.flatten(1)
    end # def

    def extract_trades(parsed_asset_content)
      trades = []
      parsed_asset_content['FlexStatements'].each do |flex_statement|
        flex_statement['FlexStatement'].each do |flex_statement_content|
          flex_statement_content['Trades'].each do |trades_content|
            # return trades_content['Trade']
            trades << trades_content['Trade'] unless trades_content['Trade'].nil?
          end # flex_statement_content[:trades].each
        end # flex_statement[:flexstatement].each
      end # parsed_asset_content[:flexstatements].each
      return trades.flatten(1)
    end # def

    def import_orders
      raw_orders = extract_orders(parsed_asset_content)
      import = ITSF::FundReports::Trades::OrderImport.new(raw_orders)
      orders = import.run
      orders.each do |order|
        order.update_attribute(:flex_query_run_id, self.id)
      end
      orders
    end # def

    def import_trades
      raw_trades = extract_trades(parsed_asset_content)
      import = ITSF::FundReports::Trades::TradeImport.new(raw_trades)
      trades = import.run
      trades.each do |trade|
        trade.update_attribute(:flex_query_run_id, self.id)
      end
      trades
    end # def

    def parsed_asset_content
      XmlSimple.xml_in(asset_content, :ForceArray => true) #, :KeyToSymbol => true)
    end # def
  end
end
