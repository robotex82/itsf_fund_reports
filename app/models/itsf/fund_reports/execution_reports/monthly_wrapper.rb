module ITSF::FundReports
  module ExecutionReports
    class MonthlyWrapper
      include ActiveModel::Validations
      include ActiveModel::Conversion
      extend ActiveModel::Naming
      
      attr_accessor :start_date
      attr_accessor :end_date
      attr_accessor :result

      validates_presence_of :start_date
      validates_presence_of :end_date


      def initialize(attributes = {})
        attributes.each do |name, value|
          send("#{name}=", value)
        end if attributes.respond_to?(:each)
      end
      
      def persisted?
        false
      end
      
      def run
        date_range = DateRange.new(start_date.to_date, end_date.to_date)
        executions = Execution.executed_between(date_range.start_date, date_range.end_date).all
        #executions = Execution.where(:executed_at => date_range).all
        self.result = ExecutionReports::Monthly.new(executions, date_range)
      end # def
    end # class MonthlyWrapper
  end # module ExecutionReports
end # module ITSF::FundReports

