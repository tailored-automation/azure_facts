require 'spec_helper'
require 'facter/util/azure_facts'
require 'facter/azure_tags'

describe 'azure_tags' do
  let(:response) do
    Net::HTTPSuccess.new(1.0, '200', 'OK')
  end
  let(:http) { instance_double(Net::HTTP) }

  it 'returns tags' do
    allow(Net::HTTP).to receive(:new).and_return(http)
    allow(http).to receive(:request) { response }
    allow(response).to receive(:body).and_return(my_fixture_read('metadata1.json'))
    expect(Facter.value(:azure_tags).fetch('role')).to eq('puppet')
  end

  it 'returns nothing' do
    allow(Net::HTTP).to receive(:new).and_return(http)
    allow(http).to receive(:request) { response }
    allow(response).to receive(:body).and_return('')
    expect(Facter.value(:azure_tags)).to eq({})
  end
end
