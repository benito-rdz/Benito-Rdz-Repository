// SPDX-License-Identifier: GPL-3.0 
pragma solidity >=0.4.16 <0.9.0;

contract Funciones {

    //Funciones: Unidad ejecutable dentro de un contrato. 
    //calculadora
    int internal operador1; //declaro las variables
    int  public operador2;
    int private resultado;

    
    //Funciones
    //Recibe parámetros y no regresa nada
    
    function asignarDatos(int _parametro1, int _parametro2) public { //la firma de la función
        operador1 = _parametro1;
        operador2 = _parametro2;
    }

    //No recibe parametros y no regresa nada
    function sumar() public {
        resultado= operador1 + operador2;
    
    }
    //Regresa un valor
    function obtenerResultado() public view returns(int){ //esto es el returns dentro de la firma y fuera es return sin "s"

        return resultado;
    }

    //Regresa múltiples valores

    function obtenerValores()public view returns(int, int, int){
        return (operador1, operador2, resultado);

    }

    //Ingresar datos
    //Reciba un valor y que regrese multiples valores.
    //int suma;
    //function recibirValores (int _valor1, int _valor2, int _valor3) public returns (int){
     //   suma = _valor1 + _valor2 + _valor3;
     //   return suma;
    //}


    //
    //Reciba varios valores y regrese varios valores


    //funcion dentro de otra función
    function resta(int _parametro1, int _parametro2) public{
        asignarDatos(_parametro1, _parametro2);
        resultado = _parametro1 - _parametro2;
        //return resultado;
    }

    //quiero que este contrato solo se modifique solo para mi address.
    address public owner;
    constructor (int _parametro1, int _parametro2){
        owner = msg.sender;
    asignarDatos(_parametro1,_parametro2);
    

}
}

