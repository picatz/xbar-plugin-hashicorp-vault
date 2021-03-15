#!/bin/bash

# <xbar.title>Vault</xbar.title>
# <xbar.version>v0.0.1</xbar.version>
# <xbar.author>Kent 'picat' Gruber</xbar.author>
# <xbar.author.github>picatz</xbar.author.github>
# <xbar.desc>Display HashiCorp Vault Status Information</xbar.desc>
# <xbar.dependencies>Bash</xbar.dependencies>

# <xbar.var>string(VAULT_ADDR="http://localhost:8200"): Vault address.</xbar.var>
# <xbar.var>string(VAULT_TOKEN=""): Vault API token.</xbar.var>

vault_icon="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"
echo "|image=$vault_icon"
echo "---"
VAULT_VERSION=$(/usr/local/bin/vault version | /usr/bin/awk '{print $2}')
echo "Local Version: $VAULT_VERSION | disabled=true | size=10 | font=Courier"
echo "Vault Address: $VAULT_ADDR | href=$VAULT_ADDR | size=10 | font=Courier"
echo "---"
VAULT_STATUS=$(/usr/local/bin/vault status -format=json)
VAULT_STATUS_SEAL_TYPE=$(echo $VAULT_STATUS | /usr/local/bin/jq -r .type)
VAULT_STATUS_INITIALIZED=$(echo $VAULT_STATUS | /usr/local/bin/jq -r .initialized)
VAULT_STATUS_SEALED=$(echo $VAULT_STATUS | /usr/local/bin/jq -r .sealed)
VAULT_STATUS_VERSION=$(echo $VAULT_STATUS | /usr/local/bin/jq -r .version)
echo "Version:     $VAULT_STATUS_VERSION | font=Courier"
echo "Initialized: $VAULT_STATUS_INITIALIZED | font=Courier"
echo "Seal Type:   $VAULT_STATUS_SEAL_TYPE | font=Courier"
echo "Sealed:      $VAULT_STATUS_SEALED | font=Courier"
