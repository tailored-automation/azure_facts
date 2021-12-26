require 'spec_helper'
require 'facter/util/azure_facts'
require 'facter/azure_location'

describe 'azure_location' do
  let(:response) do
    Net::HTTPSuccess.new(1.0, '200', 'OK')
  end
  let(:http) { instance_double(Net::HTTP) }

  it 'returns a location' do
    allow(Net::HTTP).to receive(:new).and_return(http)
    allow(http).to receive(:request) { response }
    allow(response).to receive(:body).and_return(my_fixture_read('metadata1.json'))
    expect(Facter.value(:azure_location)).to eq('westus2')
  end

  it 'returns nothing' do
    allow(Net::HTTP).to receive(:new).and_return(http)
    allow(http).to receive(:request) { response }
    allow(response).to receive(:body).and_return('')
    expect(Facter.value(:azure_location)).to be_nil
  end
end
