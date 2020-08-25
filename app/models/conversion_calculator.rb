class ConversionCalculator
  attr_accessor :in_phones
  attr_accessor :credit_phones
  def initialize(in_phones, credit_phones)
    @in_phones = []
    @credit_phones = credit_phones
    in_phones.each do |p|
      c = CustomerRequestPhone.new(p)
      @in_phones << c if c.valid? && !@in_phones.include?(c)
    end
  end

  def conversion
    intersection_count = (@in_phones.map { |e| e.phone } & @credit_phones).count
    conversion = (intersection_count.to_f / @in_phones.count.to_f) * 100
    conversion.round(2)
  end
end
