require 'pry'
class Person
  attr_accessor :name, :age, :height
  def initialize(**args)
    args.each do |property, value|
      self.public_send("#{property}=", value)
    end
  end

  def method_missing(meth, *args)
    meth.to_s.end_with?("=")
  #   if meth == :zorp!
  #     "Zip Zip Zoop"
  #   else
  #     super
  #   end
  # end
end

steven = Person.new
puts steven.zorp!
puts steven.zlarking!
