ActiveAdmin.register ITSF::FundReports::FlexQuery::Recurrence do
  menu :parent => Proc.new { I18n.t('itsf.fund_reports.active_admin.flex_queries.menu') }.call
end # ActiveAdmin.register
