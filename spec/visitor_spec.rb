require 'rspec'
require './lib/visitor'

RSpec.describe Visitor do
  let (:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let (:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let (:visitor3) {Visitor.new('Penny', 64, '$15')}

  describe '#it initializes with attributes' do
    it 'exists' do
      expect(visitor1).to be_a Visitor
      expect(visitor2).to be_a Visitor
      expect(visitor3).to be_a Visitor
    end

    xit 'visitor has a name' do
      expect(visitor1.name).to eq("Bruce")
      expect(visitor2.name).to eq("Tucker")
      expect(visitor3.name).to eq("Penny")
    end

    xit 'visitor has a height attribute' do
      expect(visitor1.height).to eq(54)
      expect(visitor2.height).to eq(36)
      expect(visitor3.height).to eq(64)
    end

    xit 'visitor has spending money' do
      expect(visitor1.spending_money).to eq(10)
      expect(visitor2.spending_money).to eq(5)
      expect(visitor3.spending_money).to eq(15)
    end

    xit 'visitor has an empty array of preferences' do
      expect(visitor1.preferences).to eq([])
      expect(visitor2.preferences).to eq([])
      expect(visitor3.preferences).to eq([])
    end
  end

  describe "#visitor preferences are dynamic do" do
    xit 'visitor preferences can be added to the array' do
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:water)

      expect(visitor1.preferences).to eq([:gentle, :water])
    end
  end

  describe "#visitors have their hight checked" do
    xit 'visitors arent tall enough by default' do
      expect(visitor1.tall_enough?(54)).to be true
      expect(visitor2.tall_enough?(54)).to be false
      expect(visitor3.tall_enough?(54)).to be true
      expect(visitor1.tall_enough?(64)).to be false
    end
  end
end