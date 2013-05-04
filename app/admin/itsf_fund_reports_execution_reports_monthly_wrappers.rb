ActiveAdmin.register ITSF::FundReports::ExecutionReports::MonthlyWrapper do
  menu :parent => Proc.new { I18n.t('itsf.fund_reports.active_admin.executions.menu') }.call

  config.comments = false
  before_filter do
    @skip_sidebar = true
  end # before_filter

  controller do
    def index
      redirect_to :action => :new
    end # def

    def create
      @report = ITSF::FundReports::ExecutionReports::MonthlyWrapper.new(params[:itsf_fund_reports_execution_reports_monthly_wrapper])
      if @report.valid?
        @report.run
        render :layout => 'active_admin'
      else
        new!
      end # if
    end # def
  end # controller

  form do |f|
    f.inputs do
      f.input :start_date, :as => :datepicker
      f.input :end_date, :as => :datepicker
    end
    f.actions
  end
end # ActiveAdmin.register

