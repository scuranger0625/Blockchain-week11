// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract a {
    uint storageData;
    // set 存取資料
    function set(uint x)public {
        storageData = x;    
    }
    // get 獲取資料 全域回傳用returns 函式內部用 return
    function get() public view returns (uint) {
        return storageData;
    }

}



