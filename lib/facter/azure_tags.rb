Facter.add(:azure_tags) do
  setcode do
    if Facter.value('cloud.provider') == 'azure'
      metadata = Facter.value(:az_metadata).to_h
      tags = {}
      metadata.dig('compute', 'tagsList').to_a.each do |tag|
        tags[tag['name']] = tag['value']
      end
      tags
    end
  end
end
