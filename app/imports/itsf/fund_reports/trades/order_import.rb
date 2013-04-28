module ITSF::FundReports
  class Trades::OrderImport
    KEY_MAPPINGS = {
      'accountId'             => 'account.name',
      'assetCategory'         => 'asset_category.name',
      'brokerageOrderID'      => 'brokerage_order_ifentifier',
      'buySell'               => 'action.name',
      'changeInPrice'         => 'change_in_price',
      'changeInQuantity'      => 'change_in_quantity',
      'clearingFirmID'        => 'clearing_firm_identifier',
      'closePrice'            => 'close_price',
      'conid'                 => 'con_identifier',
      'cost'                  => 'cost',
      'currency'              => 'currency.name',
      'cusip'                 => 'cusip',
      'description'           => 'description',
      'exchange'              => 'exchange.name',
      'exchOrderId'           => 'exch_order_identifier',
      'expiry'                => 'expiry',
      'extExecID'             => 'ext_exec_identifier',
      'fifoPnlRealized'       => 'fifo_pnl_realized',
      'fxRateToBase'          => 'fx_rate_to_base',
      'holdingPeriodDateTime' => 'holding_period_date_time',
      'ibCommissionCurrency'  => 'ib_commission_currency.name',
      'ibCommission'          => 'ib_commission',
      'ibExecID'              => 'ib_exec_identifier',
      'ibOrderID'             => 'ib_order_identifier',
      'isin'                  => 'security.name',
      'issuer'                => 'issuer',
      'levelOfDetail'         => 'level_of_detail',
      'mtmPnl'                => 'mtm_pnl',
      'multiplier'            => 'multiplier',
      'netCash'               => 'net_cash',
      'notes'                 => 'notes',
      'openCloseIndicator'    => 'open_close_indicator',
      'openDateTime'          => 'open_date_time',
      'orderPlacementTime'    => 'order_placement_time',
      'orderReference'        => 'order_reference',
      'orderTime'             => 'order_time',
      'orderType'             => 'order_type.name',
      'origOrderID'           => 'orig_order_identifier',
      'origTradeDate'         => 'orig_trade_date',
      'origTradeID'           => 'orig_trade_identifier',
      'origTradePrice'        => 'orig_trade_price',
      'proceeds'              => 'proceeds',
      'putCall'               => 'put_call',
      'quantity'              => 'quantity',
      'reportDate'            => 'report_date',
      'securityID'            => 'security_indentifier',
      'securityIDType'        => 'security_id_type',
      'settleDateTarget'      => 'settle_date_target',
      'strike'                => 'strike',
      'symbol'                => 'symbol.name',
      'taxes'                 => 'taxes',
      'tradeDate'             => 'trade_date',
      'tradeID'               => 'trade_identifier',
      'tradeMoney'            => 'trade_money',
      'tradePrice'            => 'trade_price',
      'tradeTime'             => 'trade_time',
      'transactionType'       => 'transaction_type.name',
      'underlyingConid'       => 'underlying_con_identifier',
      'underlyingSymbol'      => 'underlying_symbol.name',
      'volatilityOrderLink'   => 'volatility_order_link',
      'whenRealized'          => 'when_realized',
      'whenReopened'          => 'when_reopened'
    }

    attr_accessor :raw_orders, :orders

    def initialize(raw_orders = [])
      self.raw_orders = raw_orders
      self.orders = []
    end # def

    def run
      raw_orders.each do |order|
        processed_order = process(order)
        self.orders << Trades::Order.create!(processed_order)
      end
      orders
    end # def

    private

    def aggregate_dates(order)
      if order.has_key?('trade_time') and order.has_key?('trade_date')
        order['trade_time'] = "#{order['trade_date']};#{order['trade_time']}"
        order.delete('trade_date')
      end # if
      order
    end # def

    def map_associations(order)
      order.each do |key, value|
        if key =~ /(.*)\.(.*)/
          association_name = $~[1].to_sym
          association_attribute = $~[2]
          association = ITSF::FundReports::Trades::Order.reflect_on_association(association_name)
          associated = association.klass.where(association_attribute => value).first_or_create
          order[association_name] = associated
          order.delete(key)
        end
      end
      order
    end # def

    def normalize_dates(order)
      order.each do |key, value|
        # 20130424;033740
        if value =~ /([0-9]{4})([0-9]{2})([0-9]{2});([0-9]{2})([0-9]{2})([0-9]{2})/
          year = $~[1]
          month = $~[2]
          day = $~[3]
          hour = $~[4]
          minute = $~[5]
          second = $~[6]
          order[key] = Time.mktime(year, month, day, hour, minute, second)
        end # if
      end # order.each
      order
    end # def

    def normalize_keys(order)
      order.each do |key, value|
        if KEY_MAPPINGS.has_key?(key) && KEY_MAPPINGS[key] != key
          order[KEY_MAPPINGS[key]] = value
          order.delete(key)
        end # if
      end # order.each
      order
    end # def

    def process(order)
      order = normalize_keys(order)
      order = aggregate_dates(order)
      order = normalize_dates(order)
      order = map_associations(order)
      order
    end # def
  end # class Trades::OrderImport
end # module ITSF::FundReports

