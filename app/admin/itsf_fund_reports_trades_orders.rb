ActiveAdmin.register ITSF::FundReports::Trades::Order do
  # menu entry settings
  menu :parent => Proc.new { I18n.t('itsf.fund_reports.active_admin.trades.menu') }.call

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
    default_actions
  end # index
end # ActiveAdmin.register

