class Person
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

  def initialize(**args)
    args.each do |property, value|
      self.public_send("#{property}=", value)
    end
  end
end
