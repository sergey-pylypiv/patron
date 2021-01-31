// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.7.0;


contract LendingPoolAddressesProvider {

  mapping(bytes32 => address) private _addresses;

  bytes32 private constant POOL_ADMIN = 'POOL_ADMIN';

  function getPoolAdmin() external view returns (address) {
    return getAddress(POOL_ADMIN);
  }

  function setLendingPoolImpl(address pool) external {
    _updateImpl(LENDING_POOL, pool);
    emit LendingPoolUpdated(pool);
  }

}