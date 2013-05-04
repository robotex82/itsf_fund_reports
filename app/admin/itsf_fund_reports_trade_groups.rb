ActiveAdmin.register ITSF::FundReports::TradeGroup do
  # menu entry settings
  menu :parent => Proc.new { I18n.t('itsf.fund_reports.active_admin.trades.menu') }.call
  
  index do
    selectable_column
    column :underlying_symbol
    column :first_open_time
    column :last_close_time
    column :pnl_points
    column :trades_count
    column :multiplier
    default_actions
  end # index

  show do |trade_group|
    attributes_table do
      trade_group.attribute_names.each do |attr|
        row attr
      end
    end # attributes_table

    panel ITSF::FundReports::Trades::Trade.model_name.human(:count => :other) do
      table_for trade_group.trades do |trade|
        column :trade_time
        column :open_close_indicator
        column :quantity
        column :trade_price
      end
    end # panel

    active_admin_comments
  end # show
end # ActiveAdmin.register
