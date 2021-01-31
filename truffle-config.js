
module.exports = {


  networks: {

    development: {
      host: "localhost",
      port: 9545,
      network_id: "*",
      gas: 507062308
           

    },   
  },


  mocha: {
    timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
       version: "0.7.0",    
       docker: true,   
       parser: "solcjs",
       settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
        //evmVersion: "byzantium"
      }
    }   
  }
};
