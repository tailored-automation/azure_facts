require 'spec_helper'
require 'facter/azure_private_ips'

describe 'azure_private_ips' do
  before(:each) do
    allow(Facter).to receive(:value).with('cloud.provider').and_return('azure')
  end

  it 'returns private IPs' do
    allow(Facter).to receive(:value).with(:az_metadata).and_return(JSON.parse(my_fixture_read('metadata1.json')))
    expect(Facter.fact(:azure_private_ips).value).to eq(['10.20.1.4'])
  end

  it 'returns nothing' do
    allow(Facter).to receive(:value).with(:az_metadata).and_return(nil)
    expect(Facter.fact(:azure_private_ips).value).to be_nil
  end
end
