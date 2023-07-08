# Report


## Non Critical Issues


| |Issue|Instances|
|-|:-|:-:|
| [NC-1](#NC-1) | Missing checks for `address(0)` when assigning values to address state variables | 1 |
| [NC-2](#NC-2) | Expressions for constant values such as a call to keccak256(), should use immutable rather than constant | 5 |
| [NC-3](#NC-3) | Constants in comparisons should appear on the left side | 6 |
| [NC-4](#NC-4) | Lines are too long | 1 |
| [NC-5](#NC-5) | Functions not used internally could be marked external | 5 |
| [NC-6](#NC-6) | Variable names don't follow the Solidity style guide | 1 |
### <a name="NC-1"></a>[NC-1] Missing checks for `address(0)` when assigning values to address state variables

*Instances (1)*:
```solidity
File: Counter.sol

9:         s_timelock = timelock;

```

### <a name="NC-2"></a>[NC-2] Expressions for constant values such as a call to keccak256(), should use immutable rather than constant
constants should be used for literal values written into the code, and immutable variables should be used for expressions, or values calculated in, or passed into the constructor.

*Instances (5)*:
```solidity
File: RBACTimelock.sol

59:     bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

60:     bytes32 public constant PROPOSER_ROLE = keccak256("PROPOSER_ROLE");

61:     bytes32 public constant EXECUTOR_ROLE = keccak256("EXECUTOR_ROLE");

62:     bytes32 public constant CANCELLER_ROLE = keccak256("CANCELLER_ROLE");

63:     bytes32 public constant BYPASSER_ROLE = keccak256("BYPASSER_ROLE");

```

### <a name="NC-3"></a>[NC-3] Constants in comparisons should appear on the left side
Constants should appear on the left side of comparisons, to avoid accidental assignment

*Instances (6)*:
```solidity
File: ManyChainMultiSig.sol

239:                     if (group == 0) {

249:             if (s_config.groupQuorums[0] == 0) {

399:         if (signerAddresses.length == 0 || signerAddresses.length > MAX_NUM_SIGNERS) {

423:                 if ((i != 0 && groupParents[i] >= i) || (i == 0 && groupParents[i] != 0)) {

426:                 bool disabled = groupQuorums[i] == 0;

452:         assert(s_config.signers.length == 0);

```

### <a name="NC-4"></a>[NC-4] Lines are too long
Recommended by solidity docs to keep lines to 120 characters or lesser

*Instances (1)*:
```solidity
File: RBACTimelock.sol

188:     function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, AccessControlEnumerable) returns (bool) {

```

### <a name="NC-5"></a>[NC-5] Functions not used internally could be marked external

*Instances (5)*:
```solidity
File: ConfirmedOwnerWithProposal.sol

30:   function transferOwnership(address to) public override onlyOwner {

50:   function owner() public view override returns (address) {

```

```solidity
File: Counter.sol

12:     function setNumber(uint256 newNumber) public onlyTimelock {

16:     function increment() public onlyTimelock {

20:     function mockRevert() public pure {

```

### <a name="NC-6"></a>[NC-6] Variable names don't follow the Solidity style guide
Constant variable should be all caps  each word should use all capital letters, with underscores separating each word (CONSTANT_CASE)

*Instances (1)*:
```solidity
File: ARMProxy.sol

16:   string public constant override typeAndVersion = "ARMProxy 1.0.0";

```


## Low Issues


| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Do not use deprecated library functions | 5 |
| [L-2](#L-2) | Empty Function Body - Consider commenting why | 4 |
### <a name="L-1"></a>[L-1] Do not use deprecated library functions

*Instances (5)*:
```solidity
File: RBACTimelock.sol

142:         _setupRole(ADMIN_ROLE, admin);

146:             _setupRole(PROPOSER_ROLE, proposers[i]);

151:             _setupRole(EXECUTOR_ROLE, executors[i]);

156:             _setupRole(CANCELLER_ROLE, cancellers[i]);

161:             _setupRole(BYPASSER_ROLE, bypassers[i]);

```

### <a name="L-2"></a>[L-2] Empty Function Body - Consider commenting why

*Instances (4)*:
```solidity
File: ConfirmedOwner.sol

11:   constructor(address newOwner) ConfirmedOwnerWithProposal(newOwner, address(0)) {}

```

```solidity
File: ManyChainMultiSig.sol

45:     receive() external payable {}

```

```solidity
File: OwnerIsCreator.sol

9:   constructor() ConfirmedOwner(msg.sender) {}

```

```solidity
File: RBACTimelock.sol

183:     receive() external payable {}

```


## Medium Issues


| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 8 |
### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact:
Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (8)*:
```solidity
File: ARMProxy.sol

27:   function setARM(address arm) public onlyOwner {

```

```solidity
File: ConfirmedOwnerWithProposal.sol

30:   function transferOwnership(address to) public override onlyOwner {

```

```solidity
File: ManyChainMultiSig.sol

44: contract ManyChainMultiSig is Ownable2Step {

398:     ) external onlyOwner {

```

```solidity
File: RBACTimelock.sol

50: contract RBACTimelock is AccessControlEnumerable, IERC721Receiver, IERC1155Receiver {

360:     function updateDelay(uint256 newDelay) external virtual onlyRole(ADMIN_ROLE) {

415:     function blockFunctionSelector(bytes4 selector) external onlyRole(ADMIN_ROLE) {

427:     function unblockFunctionSelector(bytes4 selector) external onlyRole(ADMIN_ROLE) {

```

