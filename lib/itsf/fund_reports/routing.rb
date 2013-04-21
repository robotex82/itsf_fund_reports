module ITSF
  module FundReports
    class Routing
      def self.routes(router, options = {})
        options.reverse_merge!({})

        # router.resources :posts, :controller => 'itsf/fund_reports/posts'
      end # def
    end # Routing
  end # module FundReports
end # module ITSF

