const DecentralizedWebHosting = artifacts.require("DecentralizedWebHosting");

module.exports = function(deployer) {
  deployer.deploy(DecentralizedWebHosting);
};
