ActiveAdmin.register ITSF::FundReports::FlexQuery::Run do
  menu :parent => Proc.new { I18n.t('itsf.fund_reports.active_admin.flex_queries.menu') }.call

  form do |f|
    f.inputs :html => { :enctype => "multipart/form-data" } do
      f.input :flex_query
      f.input :asset, :as => :file
    end # f.inputs

    f.actions
  end # form

  member_action :import do
    run = ITSF::FundReports::FlexQuery::Run.find(params[:id])
    if run.import
      redirect_to({ :action => :show }, { :notice => "Succeeded!" })
    else
      redirect_to({ :action => :show }, { :notice => run.errors.full_messages.to_sentence })
    end
  end # import

  index do
    selectable_column
    column :flex_query
    column :asset do |run|
      link_to(t('active_admin.download'), run.asset.url)
    end # column
    column :created_at
    column :updated_at
    column :imported_at    
    default_actions
    column '' do |run|
      link_to(t('active_admin.import'), [:import, :admin, run])
    end # column
  end # index
end # ActiveAdmin.register

