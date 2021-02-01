const LendingPoolAddressesProvider         = artifacts.require("LendingPoolAddressesProvider");
const LendingPoolAddressesProviderRegistry = artifacts.require("LendingPoolAddressesProviderRegistry");



module.exports = async function(deployer, network, addresses) {
										 await deployer.deploy(LendingPoolAddressesProvider);
	const lendingPoolAddressesProvider = await LendingPoolAddressesProvider.deployed();

												 await deployer.deploy(LendingPoolAddressesProviderRegistry);
	const lendingPoolAddressesProviderRegistry = await LendingPoolAddressesProviderRegistry.deployed();

	await lendingPoolAddressesProviderRegistry.registerAddressesProvider(lendingPoolAddressesProvider.address, 1);

}