require 'facter/util/azure_facts'

Facter.add(:azure_location) do
  setcode do
    metadata = Facter::Util::AzureFacts.metadata
    metadata.dig('compute', 'location')
  end
end
