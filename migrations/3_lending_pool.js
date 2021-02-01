const LendingPoolAddressesProvider  = artifacts.require("LendingPoolAddressesProvider");
const LendingPool                   = artifacts.require("LendingPool");


module.exports = async function(deployer, network, addresses) {
										 
	const lendingPoolAddressesProvider = await LendingPoolAddressesProvider.deployed();

							await deployer.deploy(LendingPool);
	const lendingPoolImpl = await LendingPool.deployed();

	await lendingPoolAddressesProvider.setLendingPoolImpl(lendingPoolImpl.address);

	

	

}