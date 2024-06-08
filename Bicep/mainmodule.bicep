param location string = resourceGroup().location

@minLength(3)
@maxLength(24)
param storageAccountName string = 'testbiceccount'

param containerName string = 'imagefromimport'

module storage 'storage.bicep' = {
  name: 'storageModule'
  params: {
    location: location
    name: storageAccountName
    type: 'Standard_LRS'
    containerName: containerName
  }
}
