require 'pry'
require_relative 'class_macro.rb'

module Dynamic
  def self.create_accessors(*properties)
    properties.each do |property|
      define_method property do
        instance_variable_get("@#{property}")
      end

      define_method "#{property}=" do |new_value|
        instance_variable_set("@#{property}", new_value)
      end
    end
  end
end

class Person
  extend Dynamic
  attr_accessor :name, :age, :height
  def initialize(**args)
    args.each do |property, value|
      unless self.methods.include?(property)
        self.class.create_accessors(property)
      end
      self.public_send("#{property}=", value)
    end
  end

  def method_missing(meth, *args)
    # binding.pry
    if meth.to_s.end_with?("=")
      self.class.create_accessors(meth.to_s.gsub("=",""))
      # binding.pry
      self.send(meth,args.first)
    else
      super(meth)
    end
  end


end
