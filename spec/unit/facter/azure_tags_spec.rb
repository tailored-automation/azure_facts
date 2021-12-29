require 'spec_helper'
require 'facter/azure_tags'

describe 'azure_tags' do
  before(:each) do
    allow(Facter).to receive(:value).with('cloud.provider').and_return('azure')
  end

  it 'returns tags' do
    allow(Facter).to receive(:value).with(:az_metadata).and_return(JSON.parse(my_fixture_read('metadata1.json')))
    expect(Facter.fact(:azure_tags).value.fetch('role')).to eq('puppet')
  end

  it 'returns nothing' do
    allow(Facter).to receive(:value).with(:az_metadata).and_return(nil)
    expect(Facter.fact(:azure_tags).value).to eq({})
  end
end
