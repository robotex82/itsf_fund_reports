ActiveAdmin.register ITSF::FundReports::Execution, {:sort_order => :executed_at} do
  index do
    selectable_column
      column :executed_at
      column :action
      column :quantity
      column :underlying
      column :price
      column :description
      column :order_identifier
      column :order_reference
    default_actions
  end # index
end # ActiveAdmin.register

