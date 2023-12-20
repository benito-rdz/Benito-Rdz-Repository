// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface IERC20 { //Aca se definen las funcione. Firma de la función
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}


contract ERC20 is IERC20{// cuando agrego el IERC20

    // Variables de estado. Se almacenen en la EVM. Su almacenmiento es permanente.

    string private _name; //son privadas y pueden acceder solo a esto.
    string private _symbol;
    uint8 private _decimals;

    uint256 private _totalSupply;

//guardar los balances de mis  tokens
    mapping (address => uint256) private _balances; 
//Nosostros como owners a quien temenos permitido darle permisos.
    mapping (address => mapping (address => uint256)) private _allowed; 

    constructor(){
        _name = "Blockdemy Token";
        _symbol = "BAM";
        _totalSupply = 20 ether;
        _balances[msg.sender] = _totalSupply;
        //Aca es el que se va a cargar todo el dinero
    }

// por buenas prácticas, se deben colocar cada una de las funciones. Solo la consulta. 
// pero no tiene acceso.
    function name() public view override returns (string memory) {
        return _name;
    }

     function symbol() public view override returns (string memory){
        return _symbol;
    }

    function decimals() public pure override returns (uint8){
        return 18;
    }
    
    //TotalSupply retorna el total supply
    function totalSupply() external override view returns (uint256){
        return _totalSupply;
    }

    //Devolver el balance de una cuenta en especifico.
    function balanceOf(address _owner) external override view returns (uint256 balance){
        return _balances[_owner];
    }
//Cierto amount lo voy a transferir a cierta cuenta.
//necesito una address y cuantos tokens le voy a mandar.
    function transfer(address _to, uint256 _value) external override returns (bool success){
        require (_balances[msg.sender] >= _value);
        _balances[msg.sender] = _balances[msg.sender] - _value;
        _balances[_to] = _balances[_to] + _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
//Nosotros debemos darle un permismo para que haga operacioens con mis tokens.
    function transferFrom(address _from, address _to, uint256 _value) external override returns (bool success){
        require(_value <= _balances[_from]);
        require(_value <= _allowed[_from][msg.sender]);
        _balances[_from] = _balances[_from] - _value;
        _allowed[_from][msg.sender] = _allowed[_from][msg.sender] - _value;
        _balances[_to] = _balances[_to] + _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) external override returns (bool success){
        _allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
//me va a generar la cantidad máxima que tiene permitido enviar el owner 
    function allowance(address _owner, address _spender) external override view returns (uint256 remaining){
        return _allowed[_owner][_spender];
    }


}



// owmner
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//receiver
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

//spender
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
