// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Sk8Token is ERC20, ERC20Burnable, Pausable {
  constructor() ERC20("Sk8Token", "SK8") {}

  function pause() public {
    _pause();
  }

  function unpause() public {
    _unpause();
  }

  function mint(address to, uint256 amount) public {
    _mint(to, amount);
  }

  function _beforeTokenTransfer(address from, address to, uint256 amount)
    internal
    whenNotPaused
    override
    {
      super._beforeTokenTransfer(from, to, amount);
    }
}