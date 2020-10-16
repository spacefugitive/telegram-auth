require 'spec_helper'

module Telegram::Auth
  describe Fields do
    describe '#expired?' do
      let(:auth_date){ 1000 }
      let(:subject){ Fields.new({auth_date: auth_date}) }

      it 'returns false when configured off' do
        Configuration.instance.auth_expires_in = nil
        expect(subject.expired?(auth_date + 1000)).to eq(false)
      end

      it 'returns true when expired' do
        Configuration.instance.auth_expires_in = 10
        expect(subject.expired?(auth_date + Configuration.instance.auth_expires_in + 1)).to eq(true)
      end
      
      it 'returns false when valid' do
        Configuration.instance.auth_expires_in = 10
        expect(subject.expired?(auth_date + Configuration.instance.auth_expires_in - 1)).to eq(false)
      end
    end

    context "#hash" do
      let!(:token) { Configuration.instance.token = "token" }
      let(:auth_date){ 1602577243 }
      let(:id) { 123 }
      let(:first_name){ 'foo' }
      let(:last_name){ 'bar' }
      let(:username){ 'baz' }
      let(:photo_url){ 'http://foo.bar' }
      let(:subject) { Fields.new({auth_date: auth_date, id: id, first_name: first_name, last_name: last_name, username: username, photo_url: photo_url})}
      let(:hash){ "5fecd6d5fd7ab45c17f3e59da1ebbc58bbe257adf8c0228ed401dc97608ceef7" }  

      it 'returns the hash' do
        expect(subject.hash).to eq(hash)
      end
    end
    
  end
end