/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecuationresolver;
import java.util.Scanner;

/**
 *
 * @author carlo
 */
public class EcuationSolver {
    private static Scanner teclado;
    
    /**
     * Esta funcion se encarga de darnos una solucion de un valor x
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        teclado = new Scanner(System.in);
        
        System.out.print("Cual es el exponente mas alto de la ecuacion ");
        int exponente = teclado.nextInt();
        double[] coeficientes = new double[exponente+1];
        System.out.print("Ingrese un valor de x cualquiera preferiblemente [10] ");
        double valorx = teclado.nextDouble();
        System.out.print("Cuanto quieres que sea el rango de exactitud para redondear a 0 (0.1/0.xxxxx...) ");
        double minx = teclado.nextDouble();

        for(int i = exponente ; i >= 0 ; i--){
            if(i > 0){
            System.out.print("Ingresa el valor del coeficiente del miembro elevado a la " + i + "° Potencia ");
            }
            else{
            System.out.print("Ingresa el valor del coeficiente sin potencia ");
            }
            coeficientes[exponente-i] = teclado.nextDouble();
        }
        
        System.out.println("¿Su ecuacion es la siguiente?");
        imprimirecuacion(coeficientes);
        System.out.println("");
        System.out.println("[1] si, [2] no");
        int yn = teclado.nextInt();
        switch(yn){
            case 1:
                int contador = 0;
                double xfinal = valorx;
                do{
                xfinal = xfinal - (valorecuacion(coeficientes, exponente,xfinal) / sacarderivada(coeficientes, exponente,xfinal)); //evaluamos las dos funciones para formar la formula que nos da un valor de x mas aproximado hasta llegar a 0
                contador++;
                }while(valorecuacion(coeficientes, exponente,xfinal) > minx && contador <= 10000); //Se sigue ejecutando hasta que sea menor que minx es decir, que ya haya sobrepasado el nivel de precision que puso el usuario , o el contador haya tratado 10000 veces de llegar al valor de x
                if(contador < 10000 && (valorecuacion(coeficientes, exponente,xfinal) >=0 || valorecuacion(coeficientes, exponente,xfinal) <= minx)){
                    System.out.println("la x de su ecuacion es: " + xfinal + " Se soluciono en " + contador + " pasos");
                }else{
                    System.out.println("No se pudo solucionar su ecuacion");
                }
                break;
            case 2:
                System.out.println("Vuelva a intentarlo");
                break;
            default:
                System.out.println("Se equivoco");
                break;
        } 
    }
    
    /**
     * Esta funcion se encarga de solucionar una ecuacion de acuerdo al numero de coeficientes que se ingresaron y retorna el valor
     * @param coeficientes Es un arreglo de coeficientes
     * @param exponente es el expoennte que se selecciono como el mas grande
     * @param valorx Es el valor de la x a la cual evaluar la ecuacion
     * @return retorna un valor de x evaluado de acuerdo a otro valor de x recibido
     */
    public static double valorecuacion(double[] coeficientes,int exponente, double valorx){
        double xfinal = 0;
        
        for(int i = 0 ; i < coeficientes.length ; i++){
            if(i == coeficientes.length-1){// En caso de que sea el ultimo valor (el que no tiene potencia) entonces lo sumamos
                xfinal += coeficientes[i];
            }else{
                xfinal += Math.pow(valorx, exponente-i) * coeficientes[i];//Aqui resolvemos de cada uno de los miembros de la ecuacion para ir sumandoselo al valor de salida
            }
        }
        return xfinal;
    }
    
    /**
     * Esta funcion se encarga de sacar la derivida de una ecuacion de acuerdo al numero de coeficientes en ella, retorna el valor de la solucion de la ecuacion derivada
     * @param coeficientes es El arreglo de coeficientes en la ecuacion con la cual evaluarla
     * @param maxexp Es el maximo exponente que se ingreso previamente
     * @param valorx Es el valor de x recibido con el cual se evaluara la derivada
     * @return Retorna el un nuevo valor de x derivado de acuerdo al valor de x evaluado que se ingreso previamente
     */
    public static double sacarderivada(double[] coeficientes, int maxexp , double valorx){
        double valorderivado = 0;
           
        for(int i = 0 ; i < coeficientes.length ; i++){
            if(i == coeficientes.length-2){ // EN caso de que sea el penultimo valor se suma
                valorderivado += coeficientes[i];
            }else{
                if(i == coeficientes.length-1){ //En caso de que sea el ultimo valor se elimina
                    valorderivado += 0;
                }else{
                    valorderivado += coeficientes[i] * (maxexp-i) * Math.pow(valorx, maxexp-i-1); //Aqui sacamos la derivada de cada uno de los valores  para ir sumandoselo al valor de salida
                }
            }
        }
        return valorderivado;
    }
    
    /**
     * Esta funcion imprime un array acomodado desde el valor con el exponente mas alto para que pueda ser interpretado por una persoa, tecnicamente lo arregla al ojo humano
     * @param coeficientes Esta variable es el arreglo de coeficientes a imprimir
     */
    public static void imprimirecuacion(double[] coeficientes){
        for(int i = 0 ; i < coeficientes.length ; i++){
            if(i > 0 && coeficientes[i] >= 0){
                    System.out.print("+");
                }
            if(i != coeficientes.length-1){
                System.out.print(coeficientes[i]+"x" + "^" + (coeficientes.length-1-i)+ " ");
            }else{
                System.out.print(coeficientes[i] + " ");
            }
        }
    }
    
}
