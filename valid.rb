class String

  def valid? (string = self.split(//), znach = true)
    return znach if string.empty?
    return false if !( string.count % 2 ).zero? || !znach
    valid? string, ( string.pop.ord - string.shift.ord).between?(1, 2)
  end
end


  p '{|())}'.valid?
  p '{<>}'.valid?
  p '{[()]}'.valid?
