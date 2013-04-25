require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module ITSF
  module FundReports
    module Configuration
      def configure
        yield self
      end # def

      mattr_accessor :allowed_flex_query_formats
      @@allowed_flex_query_formats = []
    end # module Configuration
  end # module FundReports
end # module ITSF

