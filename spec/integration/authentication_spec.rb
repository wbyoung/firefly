describe Firefly do

  ['authentication_method', 'current_user_method'].each do |method|
    describe "::#{method}" do

      it "defaults to nil" do
        expect(Firefly.send method).to be_nil
      end

      it("can be set") do
        original = Firefly.send method
        Firefly.send "#{method}=", 'method_name'
        expect(Firefly.send method).to eq('method_name')
        Firefly.send "#{method}=", original
        expect(Firefly.send method).to eq(original)
      end
    end

  end
end
