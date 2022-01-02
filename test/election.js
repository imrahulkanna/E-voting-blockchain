var Election = artifacts.require("./Election.sol");

contract("Election", function (accouts) {
    var electionInstance;

    it("initializes with two candidates", function() {
        return Election.deployed().then(function(instance) {
            return instance.candidatesCount();
        }).then(function(count) {
            assert.equal(count,2);
        });
    }) ;

    it("it initializes the candidate with teh correct values", function() {
        return Election.deployed().then(function(instance) {
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function(candidate) {
            assert.equal(candidate[0], 1, "contains the correct id");
            assert.equal(candidate[1],"GOKU","contains the correct name");
            assert.equal(candidate[2], 0, "contains the correct vote counts");
            return electionInstance.candidates(2);
        }).then(function(candidate) {
            assert.equal(candidate[0], 2, "contains the correct id");
            assert.equal(candidate[1], "SAITAMA", "contains the corrrect name");
            assert.equal(candidate[2], 0, "contains the correct votes count");
        });
    });
});