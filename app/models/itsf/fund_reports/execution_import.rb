require 'ap'
require 'fastercsv'
# require 'csv'
# require 'roo'

module ITSF::FundReports
  class ExecutionImport < ActiveRecord::Base
    self.table_name = 'itsf_fund_reports_execution_imports'

    # associations
    has_many :executions

    # attributes
    attr_accessible :asset,
                    :asset_content_type,
                    :asset_file_name,
                    :asset_file_size,
                    :asset_updated_at,
                    :day

    # paperclip
    has_attached_file :asset

    # validations
    validates_attachment_presence :asset

#     attr_accessor :file

#    def initialize(attributes = {})
#      attributes.each { |name, value| send("#{name}=", value) }
#    end # def

#    def persisted?
#      false
#    end # def

    def import
      if imported_executions.map(&:valid?).all?
        imported_executions.each(&:save!)
        true
      else
        imported_executions.each_with_index do |execution, index|
          execution.errors.full_messages.each do |message|
            errors.add :base, "Row #{index+2}: #{message}"
          end
        end
        false
      end
    end # def

    def imported_executions
      @imported_executions ||= load_imported_executions
    end # def

    def load_imported_executions
# ap ITSF::FundReports::Execution.accessible_attributes
      imported_executions = []
      FasterCSV.foreach(asset.path, :headers => true, :col_sep => ";") do |row|
        next if row.empty?
        execution = ITSF::FundReports::Execution.where(:order_identifier => row["order_identifier"]).first || ITSF::FundReports::Execution.new
# ap row.to_hash # .slice(*ITSF::FundReports::Execution.accessible_attributes)

        row.to_hash.each do |key, value|
          if key =~ /(.*)\.(.*)/
            association_name = $~[1].to_sym
            association_attribute = $~[2]
            association = ITSF::FundReports::Execution.reflect_on_association(association_name)
            associated = association.klass.where(association_attribute => value).first_or_create
            execution.send("#{association_name}=", associated)

#ap association
#ap association.klass
#ap association_attribute
          else
            execution.send("#{key}=", value)
          end # if
        end # row.to_hash.each
# ap execution
#        execution.attributes = row.to_hash.slice(*ITSF::FundReports::Execution.accessible_attributes)
        imported_executions << execution
      end
      imported_executions
    end

#    def load_imported_executions
#      spreadsheet = open_spreadsheet
#      header = spreadsheet.row(1)
#      (2..spreadsheet.last_row).map do |i|
#        row = Hash[[header, spreadsheet.row(i)].transpose]
#        execution = execution.find_by_order_identifier(row["order_identifier"]) || execution.new
#        execution.attributes = row.to_hash.slice(*execution.accessible_attributes)
#        execution
#      end
#    end # def

#    def open_spreadsheet
#      case File.extname(asset_file_name)
#      when ".csv" then CSV.new(asset_file_name, nil, :ignore)
#      when ".xls" then Excel.new(file.path, nil, :ignore)
#      when ".xlsx" then Excelx.new(file.path, nil, :ignore)
#      else raise "Unknown file type: #{asset_file_name}"
#      end
#    end # def
  end # class ExecutionImport
end # module ITSF::FundReports

