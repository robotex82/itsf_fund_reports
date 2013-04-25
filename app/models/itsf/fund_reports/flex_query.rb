module ITSF::FundReports
  class FlexQuery < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_flex_queries'

    # associations
    belongs_to :account
    has_many :runs

    # attributes
    attr_accessible :account_id,
                    :format,
                    :query_identifier

    # validations
    validates :account, :presence => true
    validates :format, :presence => true,
                       :inclusion => Configuration.allowed_flex_query_formats.map(&:to_s)
    validates :query_identifier, :presence => true,
                                 :uniqueness => { :scope => [ :account_id ] }

    def account_name
      account.name
    end # def

    def query_id
      query_identifier
    end

    def run
      result = run_query
      asset = build_asset(result)
      runs.build(:asset => asset).save!
    end # def

    private

    def build_asset(result)
      asset = StringIO.new(result)
      asset.class.class_eval { attr_accessor :original_filename, :content_type }
      asset.original_filename = build_asset_filename
      asset.content_type = build_asset_content_type
      asset
    end # def

    def build_asset_content_type
      "text/#{format}"
    end # def

    def build_asset_filename
      "#{query_identifier}.#{format}"
    end # def

    def get_config
      config_file = File.join(Rails.root, "config/flex_query.yml")
      unless File.exists?(config_file)
        raise "Could not find flex query config file ({config_file})"
      end
      config = YAML::load_file(config_file).with_indifferent_access()
      unless config.has_key?(Rails.env)
        raise "Could not find section '#{Rails.env}' in flex query config file (#{config_file})"
      end
      unless config[Rails.env].has_key?(account_name)
        raise "Could not find section '#{account_name}' in flex query config file (#{config_file})"
      end
      unless config[Rails.env][account_name].has_key?(:token)
        raise "Could not find entry ':token' in flex query config file (#{config_file})"
      end
      config[Rails.env][account_name]
    end

    def get_token
      get_config()[:token]
    end # def

    def run_query
      options = {
        :token => get_token,
        :query_id => query_identifier,
        :format => format
      }
      ap options
      IB::Flex.new(options).run(true)
    end # def
  end
end

