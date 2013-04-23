class DateRange < Struct.new(:start_date, :end_date)
  def include?(date)
    date >= start_date && date <= end_date
  end
end
