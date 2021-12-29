Facter.add(:azure_location) do
  setcode do
    if Facter.value('cloud.provider') == 'azure'
      metadata = Facter.value(:az_metadata).to_h
      metadata.dig('compute', 'location')
    end
  end
end
