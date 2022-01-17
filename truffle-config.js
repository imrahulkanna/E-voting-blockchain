const HDWalletProvider = require('@truffle/hdwallet-provider');
var mnemonic = "infant salmon hockey excuse leader bird music high assume chronic habit rice"

module.exports = {
    // See <http://truffleframework.com/docs/advanced/configuration>
    // for more about customizing your Truffle configuration!
networks: {
    development: {
    host: "127.0.0.1",
    port: 8545,
    network_id: "*" // Match any network id
    },

    develop: {
    port: 8545
    },

    rinkeby: {
    provider: () => new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/6e36ad9ebd684529ad64283e4287eecf"),
    network_id: 4,       // Ropsten's id
    gas: 5500000,        // Ropsten has a lower block limit than mainnet
    confirmations: 2,    // # of confs to wait between deployments. (default: 0)
    timeoutBlocks: 200,  // # of blocks before a deployment times out (minimum/default: 50)
    skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
    }
}
};
