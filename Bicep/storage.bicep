param location string 
param name string 

@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_ZRS'
])
param type string = 'Standard_LRS'

param containerName string

resource stacc 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: type
  }
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
  parent: stacc
  name: 'default'
}

resource containers 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-06-01' = {
  parent: blobService
  name: containerName
}
