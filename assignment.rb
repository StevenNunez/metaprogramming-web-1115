require 'pry'
class Person
  attr_accessor :name, :age, :height
  def initialize(**args)
    args.each do |property, value|
      self.public_send("#{property}=", value)
    end
  end
end
