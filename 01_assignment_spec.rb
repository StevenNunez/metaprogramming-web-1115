require_relative 'assignment'
require 'rspec'

describe Person do
  it "has a name" do
    person = Person.new()
    person.name = "Steven"
    expect(person.name).to eq("Steven")
  end

  it "has a age" do
    person = Person.new
    person.age = 31
    expect(person.age).to eq(31)
  end

  it "has a height" do
    person = Person.new
    person.height = "6'2"
    expect(person.height).to eq("6'2")
  end

  it "allows mass assignment" do
    properties = {name: "Steven", age: 31, height: "6'2"}
    person = Person.new(properties)
    expect(person.name).to eq("Steven")
    expect(person.age).to eq(31)
    expect(person.height).to eq("6'2")
  end
end
