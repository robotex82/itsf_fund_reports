ActiveAdmin.register ITSF::FundReports::Account do
  index do
    selectable_column
    column :description
    column :name
    column :trade_count
    default_actions
  end # index
end # ActiveAdmin.register

