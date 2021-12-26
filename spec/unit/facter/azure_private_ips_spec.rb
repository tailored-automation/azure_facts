require 'spec_helper'
require 'facter/util/azure_facts'
require 'facter/azure_private_ips'

describe 'azure_private_ips' do
  let(:response) do
    Net::HTTPSuccess.new(1.0, '200', 'OK')
  end
  let(:http) { instance_double(Net::HTTP) }

  it 'returns private IPs' do
    allow(Net::HTTP).to receive(:new).and_return(http)
    allow(http).to receive(:request) { response }
    allow(response).to receive(:body).and_return(my_fixture_read('metadata1.json'))
    expect(Facter.value(:azure_private_ips)).to eq(['10.20.1.4'])
  end

  it 'returns nothing' do
    allow(Net::HTTP).to receive(:new).and_return(http)
    allow(http).to receive(:request) { response }
    allow(response).to receive(:body).and_return('')
    expect(Facter.value(:azure_private_ips)).to be_empty
  end
end
