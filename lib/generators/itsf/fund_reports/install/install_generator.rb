module ITSF
  module FundReports
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the intializer"

        source_root File.expand_path('../templates', __FILE__) 
        
        def generate_intializer
          copy_file "itsf_fund_reports.rb", "config/initializers/itsf_fund_reports.rb"
        end   
      end
    end
  end
end        