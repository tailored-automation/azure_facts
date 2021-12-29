require 'spec_helper'
require 'facter/azure_location'

describe 'azure_location' do
  before(:each) do
    allow(Facter).to receive(:value).with('cloud.provider').and_return('azure')
  end

  it 'returns a location' do
    allow(Facter).to receive(:value).with(:az_metadata).and_return(JSON.parse(my_fixture_read('metadata1.json')))
    expect(Facter.fact(:azure_location).value).to eq('westus2')
  end

  it 'returns nothing' do
    allow(Facter).to receive(:value).with(:az_metadata).and_return(nil)
    expect(Facter.fact(:azure_location).value).to be_nil
  end
end
