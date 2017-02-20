class String

  def valid? (str = self.split(//), znach = true)
    return znach if str.empty?
    return false if !( str.count % 2 ).zero? || !znach
    valid? str, ( str.pop.ord - str.shift.ord).between?(1, 2)
  end
end


  p '{|())}'.valid?
  p '{<>}'.valid?
  p '{[()]}'.valid?
