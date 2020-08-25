class CustomerRequestPhone
  attr_accessor :phone
  PHONE_NUMBER_COUNT = 10

  def initialize(s)
    @phone = s
    only_digest!
    remove_country_identifier!
  end

  def valid?
    @phone.size == PHONE_NUMBER_COUNT
  end

  private

  def only_digest!
    @phone.gsub!(/[^\d]/, "")
  end

  def remove_country_identifier!
    @phone = @phone[-PHONE_NUMBER_COUNT..-1]
  end
end

c = CustomerRequestPhone.new("+7983-234-5-2345")
p c.phone
p c.valid?