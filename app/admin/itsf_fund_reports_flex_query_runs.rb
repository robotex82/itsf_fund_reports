ActiveAdmin.register ITSF::FundReports::FlexQuery::Run do
  index do
    selectable_column
    column :asset do |run|
      link_to(t('active_admin.download'), run.asset.url)
    end # column
    column :created_at
    column :updated_at
    default_actions
  end # index
end # ActiveAdmin.register

