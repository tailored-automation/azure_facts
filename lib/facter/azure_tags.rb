require 'facter/util/azure_facts'

Facter.add(:azure_tags) do
  setcode do
    metadata = Facter::Util::AzureFacts.metadata
    tags = {}
    metadata.dig('compute', 'tagsList').to_a.each do |tag|
      tags[tag['name']] = tag['value']
    end
    tags
  end
end
