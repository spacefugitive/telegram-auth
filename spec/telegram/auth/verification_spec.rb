require 'spec_helper'

module Telegram
  describe Verification do
    let!(:token) { Configuration.instance.token = "token" }
    let(:auth_date){ 1602577243 }
    let(:id) { 123 }
    let(:first_name){ 'foo' }
    let(:last_name){ 'bar' }
    let(:username){ 'baz' }
    let(:photo_url){ 'http://foo.bar' }
    let(:fields) { Fields.new({auth_date: auth_date, id: id, first_name: first_name, last_name: last_name, username: username, photo_url: photo_url})}
    let(:hash){ "5fecd6d5fd7ab45c17f3e59da1ebbc58bbe257adf8c0228ed401dc97608ceef7" }

    let(:subject){ Verification.new(hash, fields) }

    describe '#process' do
      it 'returns true for when valid' do
        expect(subject.process).to eq(true)
      end

      context 'when fields are incorrect' do
        let(:id) { 'incorrect' }
        
        it 'returns false' do
          expect(subject.process).to eq(false)
        end
      end

      context 'when hash is incorrect' do
        let(:hash) { 'incorrect' }
        
        it 'returns false' do
          expect(subject.process).to eq(false)
        end

        it 'yields error if block given' do
          expect{ |blk| subject.process(&blk) }.to yield_with_args(Auth::ShaError)
        end
      end

      context 'when auth has expired' do
        let!(:expires_in){ Configuration.instance.auth_expires_in = 1000}
        let(:now){ Time.at(auth_date).to_datetime }
        let(:when_expired) { now + expires_in + 1 }
        
        it 'returns false' do
          Timecop.travel(when_expired) do
            expect{ |blk|
              expect(subject.process(&blk)). to eq(false)
            }.to yield_with_args(Auth::ExpiredError)
          end
        end
      end

      context 'when configured incorrectly' do
        it 'raises ConfigurationError' do
          Configuration.instance.token = nil
          expect{ subject.process }.to raise_error(Auth::ConfigurationError)
        end
      end
    end
  end
end