// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.7.0;

import './BaseImmutableAdminUpgradeabilityProxy.sol';
import '../../../dependencies/openzeppelin/upgrades/InitializableUpgradeabilityProxy.sol';

contract InitializableImmutableAdminUpgradeabilityProxy is
  BaseImmutableAdminUpgradeabilityProxy,
  InitializableUpgradeabilityProxy
{
  constructor(address admin) public BaseImmutableAdminUpgradeabilityProxy(admin) {}

  /**
   * @dev Only fall back when the sender is not the admin.
   */
  function _willFallback() internal override(BaseImmutableAdminUpgradeabilityProxy, Proxy) {
    BaseImmutableAdminUpgradeabilityProxy._willFallback();
  }
}
