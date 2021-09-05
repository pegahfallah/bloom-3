const { expect } = require("chai");
//library for testing in JS
const { ethers } = require("hardhat");

describe("Token", function () {
  let token;
  const name = "Pegah Token";
  const symbol = "PT";
  beforeEach(async () => {
    const Token = await ethers.getContractFactory("Token");
    token = await Token.deploy(name, symbol);
  });
  it("Deploy with name and symbol", async function () {
    await token.deployed();
    expect(await token.name()).to.equal(name);
    expect(await token.symbol()).to.equal(symbol);

    // wait until the transaction is mined
  });
  it("should give the deployer total supply", async function () {
    await token.deployed();
    const owner = await token.owner();
    const totalSupply = await token.totalSupply();
    console.log(owner, totalSupply); //random address hardhat creates
    expect(await token.balances(owner)).to.equal(totalSupply);
  });
  // it("sets the owner to the deployer", async function () {});
  // describe("function", function () {
  //   it("should revert if the sender does not have sufficient funds", async function () {});
  //   it("should decrease sender balance and increase recipient balance", async function () {});
  // });
});
