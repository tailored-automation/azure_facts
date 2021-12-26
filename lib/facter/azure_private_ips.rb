require 'facter/util/azure_facts'

Facter.add(:azure_private_ips) do
  setcode do
    metadata = Facter::Util::AzureFacts.metadata
    ips = []
    metadata.dig('network', 'interface').to_a.each do |interface|
      interface.dig('ipv4', 'ipAddress').to_a.each do |ipaddress|
        ip = ipaddress['privateIpAddress']
        ips << ip unless ip.nil? 
      end
    end
    ips
  end
end
