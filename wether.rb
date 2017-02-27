require 'csv'
require 'date'

class FileReader
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def process
    @weth = []
    CSV.foreach(@path, converters: :numeric) do |row|
      puts row.inspect
      @weth << row[1]
    end
    output
  end

  def output
    a = @weth.inject { |sum, n| sum + n }
    puts 'Average temperature weather is'
    p a
  end
end

reader = FileReader.new('task.csv')
reader.process
