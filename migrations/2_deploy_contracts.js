var Adoption = artifacts.require("Adoption");
var Pets = artifacts.require("./Pets.sol");


module.exports = function(deployer) {
  deployer.deploy(Adoption);
  deployer.deploy(Pets);

};