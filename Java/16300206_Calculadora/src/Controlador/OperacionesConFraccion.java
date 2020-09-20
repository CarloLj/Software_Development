/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *La Clase Operacions Con fraccion contiene lo necesario para hacer operaciones con fracciones
 * @author carlo
 */
public class OperacionesConFraccion {

            
    public static int numf = 0; //NUMERADOR FINAL
    public static int denf = 0; //DENOMINADOR FINAL
    
    /**
     * Esta funcion se encarga de realizar la operacion correspondiente para solucionar una fraccion, las fracciones tienen valores enteros
     * @param fraccion1 la primer fraccion a efectuar la operacion
     * @param fraccion2 la segunda fraccion a efectuar la operacion
     * @param Operador el operador de forma string (+,-,/,*)
     * @return retorna un string partido por una diagonal con un numerador y un denominador
     */
    public static String RealizarOperacion(Fraccion fraccion1, Fraccion fraccion2,String Operador){
        switch(Operador){
            case "+":
                numf = (fraccion1.numerador * fraccion2.denominador) + (fraccion1.denominador * fraccion2.numerador);
                denf = (fraccion1.denominador * fraccion2.denominador);
                simplificar();
            break;
                
            case "-":
                numf = (fraccion1.numerador * fraccion2.denominador) - (fraccion1.denominador * fraccion2.numerador);
                denf = (fraccion1.denominador * fraccion2.denominador);
            break;
            case "/":
                numf = (fraccion1.numerador * fraccion2.denominador);
                denf = (fraccion1.denominador * fraccion2.numerador);
            break;
            case "*":
                numf = (fraccion1.numerador * fraccion2.numerador);
                denf = (fraccion1.denominador * fraccion2.denominador);
            break;
            
            default:
                break;
        }
        return numf + "/" + denf;
    }
    
    /**
     * Esta funcion se encarga de revisar si solo hay numeros por cada campo, para que no crashee
     * @param DatoARevisar Revisa un string en busca de numeros en caso de encontrar una letra en ese string retorna un false
     * @return retorna un true o un false dependiendo si se encontraron numeros o letras
     */
    public static boolean SoloNumeros(String DatoARevisar){
        boolean cadenafinal;
        for (int n = 0; n < DatoARevisar.length(); n++){
        char c = DatoARevisar.charAt(n);
        cadenafinal = (c >= '0' && c <= '9' || c == '-');
        if(!cadenafinal){
            return false;
        }
        }
        return true;
    }
    
    /**
     * Encuentra el minimo comun divisor para poder simplificar
     * @return retorna el mcd
     */
    public static int mcd(){
        int num=numf, den=denf;
        if(num==0){
            return 1;
        }else{
            if(num<0){
                num = num * -1; 
            }
            if(den<0){
                den = den * -1; 
            }
            if(den>num){
                int aux = num;
                num=den;
                den=aux;
            }
            int mcd=1;                      
            while(den!=0){ 
                mcd=den;    
                den = num % den;  
                num = mcd;
            }
            return mcd; 
        }
    }
    
    /**
     * Simplifica un numerador y un denominador para que sean mas pequeños, de acuerdo a un mcd 
     */
    public static void simplificar(){
        int mcd = mcd();
        numf = numf / mcd;
        denf = denf / mcd;        
        if(numf<0 && denf<0){
            numf=numf*-1;         
            denf=denf*-1;                    
        }else if (numf>=0 && denf<0){
            numf=numf*-1;         
            denf=denf*-1;              
        }
    }
    
}
