// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Sk8Token is ERC20 {
  constructor() ERC20("Sk8Token", "SK8") {}

  function mint(address to, uint256 amount) public {
    _mint(to, amount);
  }

}