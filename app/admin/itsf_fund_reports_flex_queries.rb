ActiveAdmin.register ITSF::FundReports::FlexQuery do
  form do |f|
    f.inputs do
      f.input :account
      f.input :query_identifier
      f.input :format, :as => :select, :collection => ITSF::FundReports::Configuration.allowed_flex_query_formats.map(&:to_s)
    end # f.inputs

    f.actions
  end # form

  action_item :only => :show do
    link_to(t('itsf.fund_reports.flex_query.actions.run'), [:run, :admin, itsf_fund_reports_flex_query])
  end # action_item

  member_action :run do
    flex_query = ITSF::FundReports::FlexQuery.find(params[:id])
    if flex_query.run
      redirect_to({:action => :show}, {:notice => "Succeeded!"})
    else
      redirect_to({:action => :show}, {:notice => "Failed!"})
    end
  end # member_action
end # ActiveAdmin.register

