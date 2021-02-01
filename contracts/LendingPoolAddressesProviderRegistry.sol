// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.7.0;

contract LendingPoolAddressesProviderRegistry {

  mapping(address => uint256) private _addressesProviders;
  address[] private _addressesProvidersList;


  function registerAddressesProvider(address provider, uint256 id) external {
    require(id != 0, "LPAPR_INVALID_ADDRESSES_PROVIDER_ID");

    _addressesProviders[provider] = id;
    _addToAddressesProvidersList(provider);
    
  }

  function _addToAddressesProvidersList(address provider) internal {
    uint256 providersCount = _addressesProvidersList.length;

    for (uint256 i = 0; i < providersCount; i++) {
      if (_addressesProvidersList[i] == provider) {
        return;
      }
    }

    _addressesProvidersList.push(provider);
  }

}