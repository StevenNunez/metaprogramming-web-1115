require_relative 'any_assignment'
require 'rspec'

describe Person do
  it "allows you to create accessors dynamically" do
    properties = {name: "Blake", age: 31, height: "6'2"}
    person = Person.new(properties)
    expect(person.name).to eq("Blake")
    expect(person.age).to eq(31)
    expect(person.height).to eq("6'2")

    expect(person.methods).not_to include(:skill=)
    expect(person.methods).not_to include(:skill)
    person.skill = "Nunchuck Skills"
    expect(person.skill).to eq("Nunchuck Skills")
  end
end

# describe FakeOpenStruct do
#   it "is initialized with empty values" do
#     person = FakeOpenStruct.new
#
#     expect(FakeOpenStruct.instance_methods(false)).to_not include(:a_property)
#     expect(person.a_property).to be_nil
#
#     person.a_property = "AMAZINGNESS"
#     expect(person.a_property).to eq("AMAZINGNESS")
#
#     expect(FakeOpenStruct.instance_methods(false)).to_not include(:a_property)
#   end
# end
