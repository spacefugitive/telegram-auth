require 'spec_helper'

module Telegram
  describe Configuration do
    let(:instance){ Configuration.instance }

    it 'implements singleton' do
      expect{Configuration.new}.to raise_error(NoMethodError)
    end

    describe '#valid?' do  
      it 'returns true when token is provided' do
        instance.token = "foo"
        expect(instance.valid?).to eq(true)
      end
      
      it 'returns false when no token is provided' do
        instance.token = nil
        expect(instance.valid?).to eq(false)
      end
    end

    describe '#validate!' do
      it 'returns true if valid' do
        instance.token = "foo"
        expect(instance.validate!).to eq(true)
      end

      it 'raises an error if invalid' do
        instance.token = ""
        expect{ instance.validate! }.to raise_error(Auth::ConfigurationError)
      end
    end

    describe '#auth_expires_in' do
      it 'sets an auth expiration policy' do
        expect{
          instance.auth_expires_in = 999
        }.to change{instance.auth_expires_in}.to(999)
      end
    end

    describe '#verify!' do
      let(:instance){ Configuration.instance }

      it 'returns true when valid' do
        instance.token = 'foo'
        expect(instance.verify!).to be(true)
      end

      it 'throws configuration error when invalid' do
        instance.token = nil
        expect{
          instance.verify!
        }.to raise_error(Auth::ConfigurationError, "Invalid token")
      end
    end
  end
end