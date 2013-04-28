ActiveAdmin.register ITSF::FundReports::FlexQuery do
  form do |f|
    f.inputs do
      f.input :account
      f.input :query_identifier
      f.input :format, :as => :select, :collection => ITSF::FundReports::Configuration.allowed_flex_query_formats.map(&:to_s)
      f.input :description
    end # f.inputs

    f.actions
  end # form

  action_item :only => :show do
    link_to(t('itsf.fund_reports.flex_query.actions.run'), [:run, :admin, itsf_fund_reports_flex_query])
  end # action_item

  index do
    selectable_column
    column :account
    column :description
    column :query_identifier
    column :format
    column :created_at
    column :updated_at
    default_actions
    column '' do |flex_query|
      link_to(t('active_admin.run'), [:run, :admin, flex_query])
    end # column
  end # index

  member_action :run do
    flex_query = ITSF::FundReports::FlexQuery.find(params[:id])
    if flex_query.run
      redirect_to({:action => :show}, {:notice => "Succeeded!"})
    else
      redirect_to({:action => :show}, {:notice => "Failed!"})
    end
  end # member_action
end # ActiveAdmin.register

