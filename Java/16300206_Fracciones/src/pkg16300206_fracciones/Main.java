/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_fracciones;
import java. util. Scanner;
/**
 *
 * @author carlo
 */
public class Main {


    public static Scanner teclado = new Scanner( System. in);
    public static String onetohundred[] = {"cero","un","dos","tres","cuatro","cinco","seis","siete","ocho","nueve","diez","once","doce","trece","catorce","quince","dieciseis","diecisiete","dieciocho","diecinueve","veinte","veintiuno","veintidos","veintitres","veinticuatro","veinticinco","veintiseis","veintisiete","veintiocho","veintinueve","treinta","treinta y uno","treinta y dos","treinta y tres","treinta y cuatro","treinta y cinco","treinta y seis","treinta y siete","treinta y ocho","treinta y nueve","cuarenta","cuarenta y uno","cuarenta y dos","cuarenta y tres","cuarenta y cuatro","cuarenta y cinco","cuarenta y seis","cuarenta y siete","cuarenta y ocho","cuarenta y nueve","cincuenta","cincuenta y uno","cincuenta y dos","cincuenta y tres","cincuenta y cuatro","cincuenta y cinco","cincuenta y seis","cincuenta y siete","cincuenta y ocho","cincuenta y nueve","sesenta","sesenta y uno","sesenta y dos","sesenta y tres","sesenta y cuatro","sesenta y cinco","sesenta y seis","sesenta y siete","sesenta y ocho","sesenta y nueve","setenta","setenta y uno","setenta y dos","setenta y tres","setenta y cuatro","setenta y cinco","setenta y seis","setenta y siete","setenta y ocho","setenta y nueve","ochenta","ochenta y uno","ochenta y dos","ochenta y tres","ochenta y cuatro","ochenta y cinco","ochenta y seis","ochenta y siete","ochenta y ocho","ochenta y nueve","noventa","noventa y uno","noventa y dos","noventa y tres","noventa y cuatro","noventa y cinco","noventa y seis","noventa y siete","noventa y ocho","noventa y nueve","cien","cientos","mil","sete","quinientos","nove"};
    public static String fraccionarios[] = {"cero","entero","medio","tercio","cuarto","quinto","sexto","septimo","octavo","noveno","decimo","centesimo","milesimo"};
    /**
     * Esta funcion se encarga de hacer lo necesario para leer los datos de una fraccion y poder hacer la operacion correspondiente.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        tutorial();
        System.out.println("Ingrese la operacion de fraccion en forma de caracteres");
        String inputString = teclado.nextLine();
        String resultado = haceroperacion(inputString);
        System.out.println(resultado);
    }
    
    public static void tutorial(){
        System.out.println("Bienvenido al tutorial apra aprender a usar esta aplicacion");
        System.out.println("Antes que nada este programa resuelve fracciones, de forma escrita");
        System.out.println("Algunos ejemplos con los que te puedes basar");
        System.out.println("");
        System.out.println("diez cincuenta y tres-avos mas ocho cuarenta-avos = 10/53 + 8/40");
        System.out.println("un medio mas un cuarto= 1/2 + 1/4");
        System.out.println("tres cincuenta y siete-avos  entre ochenta veinte-avos= 3/57 / 80/20");
        System.out.println("Ten en cuenta que el diccionario de esta calculadora puede ser maximo hasta 100");
        System.out.println("");
        System.out.println("");
        System.out.println("Presione una tecla para continuar...");
        new java.util.Scanner(System.in).nextLine();
        
    }
    
    public static String haceroperacion(String cadenacompleta){
        
        String[] parts = cadenacompleta.split(" ");
        String[] aux = new String[parts.length-2];
        int nominador1=0;
        int denominador1=0;
        int nominador2=0;
        int denominador2=0;
        
        //for (int x=0;x<cadenacompleta.length();x++){
        //System.out.println("Caracter " + x + ": " + cadenacompleta.charAt(x));
        //}
        for(int i =0 ;i < parts.length; i++){
            System.out.println(parts[i]);
        }
        
                
        for(int i =0 ;i < parts.length; i++){
            if(i+1<parts.length){
                if(parts[i+1].equals("y")){
                    parts[i] = parts[i] + " " + parts[i+1] + " " + parts[i+2];
                    System.out.println("Se unieron " + parts[i]);
                    int valoraborrar = i+1;
                    boolean valorborrado = false;
                    for(int check =0 ; check < parts.length-2; check++){
                        if(check != valoraborrar){
                            aux[check] = parts[check];
                        }else{
                            if(valorborrado == false){
                            check--;
                            //check--;
                            valorborrado = true;
                            }
                        }
                    }
                    parts = aux;
                    System.out.println(parts.length);
                    System.out.println(aux.length);
                }
                
                if(parts[i].equals("mas")){
                
                }
                
                if(parts[i].equals("entre")){
                
                }
                
                if(parts[i].equals("menos")){
                
                }
                
                if(parts[i].equals("por")){
                
                }
                
            }
        }
      
        for(int i =0 ;i < parts.length; i++){
            System.out.println(parts[i]);
            for(int j = 0 ; j < onetohundred.length; j++){
                
                if(parts[i].equals(onetohundred[j])){
                    System.out.println("Una de las partes coincidio con el numero " + j);
                    nominador1 = j;
                }
                if(j > 10 && parts[i].equals(onetohundred[j]+"vo") || parts[i].equals(onetohundred[j]+"avo") || parts[i].equals(onetohundred[j]+"vos") || parts[i].equals(onetohundred[j]+"avos")){
                    System.out.println("Una de las partes coincidio con el numero " + j + " avo");
                    denominador1 = j;
                }
                
                if(j < fraccionarios.length && (parts[i].equals(fraccionarios[j]) || parts[i].equals(fraccionarios[j]+"s"))){
                    System.out.println("Una de las partes coincidio con el numero " + j + " fraccionario");
                    denominador1 = j; 
                }
                
                
            }
        }
        
        String cadena = nominador1 + "/" + denominador1;
        return cadena;
    }
}
