# azure_facts

Azure custom facts

#### Table of Contents

1. [Description](#description)
1. [Reference](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)

## Description

This module provides custom facts for Azure VMs that are pulled from the [Azure Metadata Service](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/instance-metadata-service?tabs=linux) via the Facter `az_metadata` fact.

## Reference

### `azure_location`

The VM's configured location. Example: `westus2`

### `azure_private_ips`

An Array of private IPs for the VM, Example: `['10.20.1.1']`

### `azure_tags`

The tags associated to the VM, Example: `{'role' => 'puppet', 'environment' => 'production'}`

### Limitations

This module is only supported on Linux based systems.
