class DateOffset
  def initialize
    @date = Time.new.strftime("%d%m%y").to_i
  end

  def date_square
    date_square = (@date ** 2)
  end

  def offset
    offset = date_square.to_s[-4..-1]
  end
end