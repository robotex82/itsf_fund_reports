module ITSF
  module FundReports
    class Engine < ::Rails::Engine
      initializer :itsf_fund_reports_engine do
        ActiveAdmin.setup do |config|
          config.load_paths << File.join(self.root, 'app/admin')
        end # ActiveAdmin.setup
      end  # initializer :itsf_fund_reports_engine do
    end # class Engine < ::Rails::Engine
  end # module FundReports
end # module ITSF

