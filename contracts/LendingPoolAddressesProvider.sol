// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.7.0;

import {InitializableImmutableAdminUpgradeabilityProxy} from './protocol/libraries/upgradeability/InitializableImmutableAdminUpgradeabilityProxy.sol';

contract LendingPoolAddressesProvider {

  mapping(bytes32 => address) private _addresses;

  bytes32 private constant POOL_ADMIN   = 'POOL_ADMIN';
  bytes32 private constant LENDING_POOL = 'LENDING_POOL';

  function getPoolAdmin() external view returns (address) {
    return getAddress(POOL_ADMIN);
  }

  function setLendingPoolImpl(address pool) external {
    _updateImpl(LENDING_POOL, pool);
  }

  function _updateImpl(bytes32 id, address newAddress) internal {
    address payable proxyAddress = payable(_addresses[id]);

    InitializableImmutableAdminUpgradeabilityProxy proxy =
      InitializableImmutableAdminUpgradeabilityProxy(proxyAddress);
    bytes memory params = abi.encodeWithSignature('initialize(address)', address(this));

    if (proxyAddress == address(0)) {
      proxy = new InitializableImmutableAdminUpgradeabilityProxy(address(this));
      proxy.initialize(newAddress, params);
      _addresses[id] = address(proxy);
      
    } else {
      proxy.upgradeToAndCall(newAddress, params);
    }
  }

  function getAddress(bytes32 id) public view returns (address) {
    return _addresses[id];
  }

}