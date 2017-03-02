require 'csv'
require 'date'

class FileReader
  def initialize(month, path)
    @month = month
    @path = path
  end

  def process
    moncalc = CSV.read(@path).map { |el| [el.first.split('.').last, el.last] }
    moncalc.select! { |el| el.first == @month }.map! { |el| [el.last].join }
    @result = 0
    moncalc.each { |a| @result += a.to_i }
    @result /= moncalc.size.to_f
    output
  end

  def output
    p "The average temperature in #{Date::MONTHNAMES[@month.to_i]} is #{@result.round(1)}"
    p '=========================================='
  end
end

p 'Input month number'
month = gets.chomp
p '=========================================='
reader = FileReader.new(month, 'task.csv')
reader.process
