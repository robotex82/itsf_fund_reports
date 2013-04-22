ActiveAdmin.register ITSF::FundReports::ExecutionImport do
  action_item :only => :show do
    link_to('Import', [:import, :admin, itsf_fund_reports_execution_import])
  end # action_item

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :day
      f.input :asset, :as => :file
    end

    f.actions
  end # form


  member_action :import do
    execution_import = ITSF::FundReports::ExecutionImport.find(params[:id])
    if execution_import.import
      redirect_to({:action => :show}, {:notice => "Imported!"})
    else
      redirect_to({:action => :show}, {:notice => "Not imported!"})
    end
  end # member_action
end # ActiveAdmin.register

