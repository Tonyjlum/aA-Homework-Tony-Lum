require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Bobby") }
  let(:applepie) { Dessert.new("Apple Pie", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(applepie.type).to eq("Apple Pie")
    end

    it "sets a quantity" do
      expect(applepie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(applepie.ingredients.empty?).to eq(true)
    end

    it "raises an argument error when given a non-integer quantity" do
      # subject(:dessert) { Dessert.new("Apple Pie", "3", :chef) }
      # when raising erros, the expect must take in block
      expect { Dessert.new("Apple Pie", "10", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      applepie.add_ingredient("Apples")
      expect(applepie.ingredients).to include("Apples")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      # applepie.add_ingredient("Apples")
      # applepie.add_ingredient("Butter")
      # applepie.add_ingredient("Sugar")
      #ensure the testing ingredients_list is sorted, rb:55 is checking for it
      ingredients_list = ["Apple", "Butter", "Sugar"]
      ingredients_list.each do |ingredient|
        applepie.add_ingredient(ingredient)
      end

      expect(applepie.ingredients).to eq(ingredients_list)
      applepie.mix!
      #Random chance that even if mix!, it can still be original.
      #Run a few times to check validity.
      expect(applepie.ingredients).not_to eq(ingredients_list)
      expect(applepie.ingredients.sort).to eq(ingredients_list)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      applepie.eat(2)
      expect(applepie.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      # when raising erros, the expect must take in block
      expect { applepie.eat(20) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Bobby the Great Baker")
      expect(applepie.serve).to eq("Chef Bobby the Great Baker has made 10 Apple Pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(applepie)
      applepie.make_more
    end
  end
end
