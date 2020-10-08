require 'spec_helper'

module Telegram
  describe Configuration do
    it 'implements singleton' do
      expect{Configuration.new}.to raise_error
    end

    describe '#valid?' do
      let(:instance){ Configuration.instance }

      it 'returns true when domain is provided' do
        instance.domain = "foo"
        expect(instance.valid?).to eq(true)
      end
      
      it 'returns false when no domain is provided' do
        instance.domain = nil
        expect(instance.valid?).to eq(false)
      end
    end

    describe '#verify!' do
      let(:instance){ Configuration.instance }

      it 'returns true when valid' do
        instance.domain = 'foo'
        expect(instance.verify!).to be(true)
      end

      it 'throws configuration error when invalid' do
        instance.domain = nil
        expect{
          instance.verify!
        }.to raise_error(ConfigurationError, "Invalid Domain")
      end
    end
  end
end