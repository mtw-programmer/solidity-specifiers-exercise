// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Specifiers {
  uint x;

  /**
  * @dev Sets and x value.
  * The function uses private specifier to restrict that only to this contract
  */
  function setX(uint n) private {
    x = n;
  }

  /**
  * @dev Adds two values and returns the sum
  * The function is marked as internal which means it's restricted to this contract and the derived contracts
  * (contracts with "is Specifiers")
  * The pure specifier says that function doesn't read and write any state variables
  * Returns specifies what type of data will be returned (in our case uint)
  */
  function add(uint a, uint b) internal pure returns (uint) {
    return a + b;
  }

  /**
  * @dev Gets the x value
  * Public means that the function can be accessed everywhere
  * The keyword view means that the function can read state variables but cannot modify it
  * Returns works like in the example above
  */
  function getX() public view returns (uint) {
    return x;
  }

  /**
  * @dev Updates the x value with the sum of a and b
  * The functions is marked as external which means it can't be executed in this or derived contracts
  */
  function updateX(uint a, uint b) external {
    uint total = add(a, b);
    setX(total);
  }
}
