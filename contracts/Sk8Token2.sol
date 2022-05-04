// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Sk8Token is ERC20, AccessControl, Pausable {

  constructor() ERC20("Sk8Token", "SK8") {
    // @dev Grant the deployer of the contract no special authority. Specify a Gnosis safe multi sig contract wallet as Default admin. This supercede all other and is able to asign roles. 
    _setupRole(DEFAULT_ADMIN_ROLE, 0x641b90eaf3f9bF2611Bfb455c5A24601228a0B93);
  }

  // @dev Define roles in contract.
  bytes32 public constant TIER1_ROLE = keccak256("MINT_AND_BURN_ROLE");
  bytes32 public constant TIER2_ROLE = keccak256("MAINTAIN_ROLE");

  // @dev Create function modifiers for access tiers.
  modifier onlyTier1 () {
    _checkRole(TIER1_ROLE);
    _;
  }

  modifier onlyTier2 () {
    _checkRole(TIER2_ROLE);
    _;
  }

  // @dev Implement assignment/revocation mechanisms.

  /* FOLLOW UP: 
  grantRole(bytes32 role, address account) 
  revokeRole(bytes32 role, address account) 
  exists within AccessControl.
  They each have check for admin and emit event support.
  */
  function giveRole(bytes32 role, address worker) public onlyRole(DEFAULT_ADMIN_ROLE) {

  }

  function removeRole(bytes32 role, address worker) public onlyRole(DEFAULT_ADMIN_ROLE) {

  }

  // @dev simple functions using role modifiers.
  function pause() public onlyTier2 {
    _pause();
  }

  function unpause() public onlyTier2 {
    _unpause();
  }

  function mint(address to, uint256 amount) 
    public  
    onlyTier1 {
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