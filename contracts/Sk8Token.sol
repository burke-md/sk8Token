// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Sk8Token is ERC20, AccessControl, ERC20Burnable, Pausable {
  bytes32 public constant MINT_AND_BURN_ROLE = keccak256("MINT_AND_BURN_ROLE");
  bytes32 public constant MAINTAIN_ROLE = keccak256("MAINTAIN_ROLE");

  constructor() ERC20("Sk8Token", "SK8") {
    // @dev Grant the deployer of the contract no special authority. Specify a Gnosis safe multi sig contract wallet as Default admin. This supercede all other and is able to asign roles. 
    _setupRole(DEFAULT_ADMIN_ROLE, 0x641b90eaf3f9bF2611Bfb455c5A24601228a0B93);
  }

  function pause() public onlyRole(MAINTAIN_ROLE) {
    _pause();
  }

  function unpause() public onlyRole(MAINTAIN_ROLE) {
    _unpause();
  }

  function mint(address to, uint256 amount) public onlyRole(MINT_AND_BURN_ROLE) {
    _mint(to, amount);
  }

  function burn(address from, uint256 amount) public onlyRole(MINT_AND_BURN_ROLE) {
    _burn (from, amount);
  }

  function _beforeTokenTransfer(address from, address to, uint256 amount)
    internal
    whenNotPaused
    override
    {
      super._beforeTokenTransfer(from, to, amount);
    }
}