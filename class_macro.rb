class Person
  ["name", "age", "height"].each do |property|
    define_method property do
      instance_variable_get("@#{property}")
    end

    define_method "#{property}=" do |new_value|
      instance_variable_set("@#{property}", new_value)
    end
  end
end

steven = Person.new
steven.name = "Steven"

require 'pry'
binding.pry
