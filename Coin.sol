// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Coin {

    address public minter;
    mapping (address => uint) public balances;
    
    // sent發送 對應到另一個帳戶
    event Sent(address from, address to, uint amount);

    // 發布合約馬上就會執行 且只會執行一次
    constructor() {
        // 某人去Deploy 就會觸發
        minter = msg.sender;

    }
    // 接收錢的人 (鑄幣機)
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }


    error InsufficientBalance(uint requested, uint available);
    // 發送前檢查餘額是否足夠
    function send(address receiver, uint amount) public  {
        require(amount <= balances[msg.sender], InsufficientBalance(amount, balances[msg.sender]));
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

}
