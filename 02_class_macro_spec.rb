require_relative 'class_macro'
require 'rspec'
describe Person do
  it "allows you to create accessors" do
    expect(Person.instance_methods(false)).to_not include(:name)
    expect(Person.instance_methods(false)).to_not include(:age)
    expect(Person.instance_methods(false)).to_not include(:height)
    
    Person.create_accessors(:name, :age, :height)

    properties = {name: "Blake", age: 31, height: "6'2"}

    person = Person.new(properties)
    expect(person.name).to eq("Blake")
    expect(person.age).to eq(31)
    expect(person.height).to eq("6'2")
  end
end
