require 'spec_helper'

module Telegram::Auth
  describe Verification do
    let!(:token) { Configuration.instance.token = "token" }
    let(:hash){ "5fecd6d5fd7ab45c17f3e59da1ebbc58bbe257adf8c0228ed401dc97608ceef7" }
    let(:fields){ double(expired?: false, hash: hash) }

    let(:subject){ Verification.new(hash, fields) }

    describe '#process' do
      it 'returns true for when valid' do
        expect(subject.process).to eq(true)
      end

      context 'when fields do not match the hash' do
        let(:fields) { double(hash: 'different') }
        
        it 'returns false' do
          expect(subject.process).to eq(false)
        end
      end

      context 'when auth has expired' do
        let(:fields){ double(expired?: true, hash: hash) }
        
        it 'returns false' do
          expect(subject.process). to eq(false)
        end
      end

      context 'when configured incorrectly' do
        it 'raises ConfigurationError' do
          Configuration.instance.token = nil
          expect{ subject.process }.to raise_error(ConfigurationError)
        end
      end
    end
  end
end