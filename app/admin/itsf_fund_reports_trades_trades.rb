ActiveAdmin.register ITSF::FundReports::Trades::Trade do
  # menu entry settings
  menu :parent => Proc.new { I18n.t('itsf.fund_reports.active_admin.trades.menu') }.call

  scope :all, :default => true

  ITSF::FundReports::Account.all.each do |account|
    scope account.name do |trades|
      trades.where(:account_id => account.id)
    end
  end if ITSF::FundReports::Account.connection.table_exists?(ITSF::FundReports::Account.table_name)

  batch_action :create_trade_group do |selection|
    trades = ITSF::FundReports::Trades::Trade.find(selection)
    trade_group = ITSF::FundReports::TradeGroup.new
    trades.each do |trade|
      trade.trade_group = trade_group
    end
    trade_group.trades = trades
    if trade_group.save!
      redirect_to(:back, :notice => "Success!")
    else
      redirect_to(:back, :notice => "Failure!")
    end
  end

  index do
    selectable_column
    column :account
    column :action
    column :underlying_symbol
    column :symbol
    column :trade_time
    column :quantity
    column :trade_price
    column :multiplier
    column :ib_commission
    column :close_price
    column :open_close_indicator
    column :ib_order_identifier
    column :order_time
    column :order_reference
    column :order
    default_actions
  end # index
end # ActiveAdmin.register

