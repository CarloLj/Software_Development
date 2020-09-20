/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_crud;
import java.util.Arrays;
import java.util.Scanner;

/**
 * Deportista solution es una clase que incluye lo necesario para ser un CRUD
 * @author carlo
 */
public class DeportistaSolution {

    static Scanner in;
    static Deportista[] deportista;
    static cmp cmpstring;
    static cmp cmpint;
    
    /**
     * Esta es una funcion de inicializacion, en donde se precargan datos para que el programa no este vacio, se agregan datos de deportistas al arreglo de deportistas
     */
    public static void mejoresdeportistasinit(){
        deportista = new Deportista[15];
        Deportista a = new Deportista("CARLO LUJAN",18,"Triatleta","Sprint","01:06:42:00");    
        deportista[0]  = a;
        a = new Deportista("CARLO LUJAN",18,"Nadador","400M Free","00:05:15:00");
        deportista[1]  = a;
        a = new Deportista("CARLO LUJAN",18,"Corredor","1K","00:02:50:00");
        deportista[2]  = a;
        a = new Deportista("CARLO LUJAN",18,"Corredor","1M","00:04:40:00");
        deportista[3]  = a;
        a = new Deportista("CARLO LUJAN",18,"Corredor","5K","00:16:35:00");
        deportista[4]  = a;
        a = new Deportista("CARLO LUJAN",18,"Corredor","10K","00:33:48:00");
        deportista[5]  = a;
        a = new Deportista("CARLO LUJAN",18,"Corredor","8K","00:25:01:00");
        deportista[6]  = a;
        a = new Deportista("MICHAEL PHELPS",45,"Nadador","200M Fly","00:01:47:00");
        deportista[7]  = a;
        a = new Deportista("CESAR CIELO",33,"Nadador","100M Free","00:00:46:16");
        deportista[8]  = a;
        a = new Deportista("CATE CAMPBELL",27,"Nadador","100M Free","00:00:50:25");
        deportista[9]  = a;
        a = new Deportista("KENENISA BEKELE",37,"Corredor","42K","02:01:41:00");
        deportista[10]  = a;
        a = new Deportista("ELIUD KIPCHOGE",35,"Corredor","42K","02:01:39:00");
        deportista[11]  = a;
        a = new Deportista("WAYDE VAN NIKERK",27,"Corredor","400M","00:00:43:03");
        deportista[12]  = a;
        a = new Deportista("USAIN BOLT",33,"Corredor","100M","00:00:09:58");
        deportista[13]  = a;
        a = new Deportista("USAIN BOLT",33,"Corredor","200M","00:00:19:19");
        deportista[14]  = a;
    }
    
    /**
     * La funcion main que tenemos aqui es la encargada de mostrarnos las distintas opciones que tenemos para usar nuestro programa, ya sea buscar, modificar, eliminar o insertar datos y nos redirigira a distintas funciones a lo largo del programa y lo que busquemos hacer
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        cmpstring = (Object obj1, Object obj2) -> { 
            if(((String)obj1).compareTo(((String)obj2)) > 0){
                return true;
            }
            if(((String)obj1).compareTo(((String)obj2)) < 0){
                return false;
            }
            return false;
        };  
        
        cmpint = (Object obj1, Object obj2) -> (Integer)obj1 > (Integer)obj2;
        
        deportista = new Deportista[0]; //Inicializamos nuestra variable deportista como un arreglo de deportistan con un tamaño de 0
        mejoresdeportistasinit(); //Rellenamos nuestra aplicacion con los datos de fabrica
        
        in = new Scanner(System.in);
        int opc = 0;
        boolean yea = false;
        do{
            System.out.println("-----DEPORTISTAPP MANAGER V1.0-----");
            System.out.println("");
            System.out.println("[1] INSERTAR NUEVO DEPORTISTA");
            System.out.println("[2] BUSCAR DEPORTISTA");
            System.out.println("[3] ACTUALIZAR DEPORTISTA");
            System.out.println("[4] ELIMINAR DEPORTISTA");
            System.out.println("[5] MOSTRAR TODOS LOS DEPORTISTAS");
            System.out.println("-----------------------------------");
            System.out.println("              [6]                 ");
            System.out.println("SALIR DE DEPORTISTAPP MANAGER V1.0");
            System.out.println("-----------------------------------");
            opc = Integer.parseInt(in.nextLine());
            switch(opc){
                case 1:
                    CreateDeportista();
                    break;
                case 2:
                    try{
                        System.out.println(deportista[TipoBusqueda()]); //Aqui se imprimira el to string de nuestro deportista, mostrandonos su informacion
                        WaitingLine();
                    }catch(java.lang.ArrayIndexOutOfBoundsException e){ //En el caso de que el arreglo se salga de los limites cachamos el error
                        System.out.println("Ese deportista no existe en deportistapp");
                        WaitingLine();
                    }
                    break;
                case 3:
                    deportista = ActualizarDeportista(deportista,TipoBusqueda()); //Aqui actualizamos a un deportista con ls datos actualizados, usando el tipo de busqueda con la que lo quiere encontrar
                    WaitingLine();
                    break;
                case 4:
                    deportista = Eliminar(deportista,TipoBusqueda()); //Eliminar como su nombre lo dice elimina al deportista, de acuerdo al tipo de busqueda que se realice
                    System.out.println("Se eliminó satisfactoriamente");
                    WaitingLine();
                    break;
                case 5:
                    MostrarTodo(deportista); //Muestra literalmente un arreglo de deportistas
                    WaitingLine();
                    break;
                case 6:
                    yea = true; //En caso de que quiera salir la bandera se pone en true para que termine el programa
                    break;
                default:
                    System.out.println("Se equivoco, escoga una opcion valida por favor [1-6]"); //En caso de una opcion invalida
            }
        }while(!yea);
}

    /**
     * Tipo de busqueda te muestra un menu para que escogas con que busqueda querras buscar los datos a modificar, a eliminar o a consultar
     * @return retorna un entero de la posicion del elemento buscado
     */
    static int TipoBusqueda(){
        int opc = 0;
        int n = 0;
        String dato;
        System.out.println("COMO QUIERE BUSCAR: ");
        System.out.println("[1] NOMBRE");
        System.out.println("[2] EDAD");
        System.out.println("[3] DEPORTE");
        System.out.println("[4] MEJOR PRUEBA");
        System.out.println("[5] MEJOR TIEMPO (xx:xx:xx:xx)");
         
        opc = Integer.parseInt(in.nextLine());
         
        cmp cmpstring1 = (Object obj1, Object obj2) -> {
            if(((String)obj1).compareTo(((String)obj2)) < 0){
                return true;
            }
            if(((String)obj1).compareTo(((String)obj2)) > 0){
                return false;
            }
            return false;
        };
         
        cmp verifyEquality = (Object obj1, Object obj2) -> ((String)obj1).equals((String)obj2);
         
        switch(opc){
            case 1:
                System.out.print("INGRESE EL NOMBRE A BUSCAR: ");
                dato = in.nextLine().toString();
                Ordenar(deportista,cmpstring, Deportista::getNombre);
                n = BBin(deportista,dato,cmpstring1, Deportista::getNombre,verifyEquality);
                break;
            case 2:
                System.out.print("INGRESE EDAD DEL DEPORTISTA: ");
                dato = in.nextLine().toString();
                Ordenar(deportista,cmpstring, (Deportista p) -> "" +p.getEdad());
                n = BBin(deportista,dato,cmpstring1, (Deportista p) -> "" +p.getEdad(),verifyEquality);
                break;
            case 3:
                System.out.print("INGRESE TIPO DE ATLETA: ");
                dato = in.nextLine().toString();
                Ordenar(deportista,cmpstring, Deportista::getDeporte);
                n = BBin(deportista,dato,cmpstring1, Deportista::getDeporte,verifyEquality);
                break;
            case 4:
                System.out.print("INGRESE PRUEBA: ");
                dato = in.nextLine().toString();
                Ordenar(deportista,cmpstring, Deportista::getMejorprueba);
                n = BBin(deportista,dato,cmpstring1, Deportista::getMejorprueba,verifyEquality);
                break;
            case 5:
                System.out.print("INGRESE MEJOR TIEMPO: ");
                dato = in.nextLine().toString();
                Ordenar(deportista,cmpstring, (Deportista p) -> "" +p.getMejortiempo());
                n = BBin(deportista,dato,cmpstring1, (Deportista p) -> "" +p.getMejortiempo(),verifyEquality);
                break;
            default:
                System.out.println("Lo siento esa opcion no esta en el menú");
        }
        return n;
    }
    
    /**
     * Mostrar todo muestra un arreglo de deportistas
     * @param deportistas es el array de deportistas que recibe
     */
    static void MostrarTodo(Deportista[] deportistas){
        for(int i = 0; i<deportistas.length;i++){
            System.out.println(deportistas[i]);
        }
    }

    /**
     * Create deportista crea un nuevo deportista con valores escogidos por el usuario, y despues se agrega al arreglo deportista
     */
    static void CreateDeportista(){
        Deportista newAthlete = new Deportista();
        System.out.print("Ingrese el nombre del deportista ");
        newAthlete.setNombre(in.nextLine().toString());
        System.out.print("Ingrese la edad ");
        newAthlete.setEdad(Integer.parseInt(in.nextLine()));
        System.out.print("Ingrese el deporte ");
        newAthlete.setDeporte(in.nextLine().toString());
        System.out.print("Ingrese su mejor prueba ");
        newAthlete.setMejorprueba(in.nextLine().toString());
        System.out.print("Ingrese el tiempo en esa prueba (xx:xx:xx:xx) ");
        newAthlete.setMejortiempo(in.nextLine().toString());
        
        
        Deportista[] temp = new Deportista[deportista.length + 1];
        for(int i = 0; i<deportista.length;i++){
            temp[i] = deportista[i]; 
        }
        temp[temp.length -1] = newAthlete;
        deportista = temp;
    }
    
    /**
     * La funcion ordenar se encarga de actualizar las posiciones de forma ordenada de un objeto arreglo de acuerdo al dato que se este buscando y es ordenado por el metodo bubble sort
     * @param Arreglo es el arreglo que recibira para ordenar
     * @param c un criterio de comparacion ya definido para verificar si es mas grande o menos grande
     * @param x El dato de un deportista en especifico
     */
    public static void Ordenar(Object[] Arreglo, cmp c, getDeportista x){
        for(int i = 0; i < Arreglo.length; i++){
            for(int j = 0; j < Arreglo.length - i - 1; j++){
                if(c.cmp(x.GET((Deportista)Arreglo[j]),x.GET((Deportista)Arreglo[j+1]))){
                    Object aux = Arreglo[j];
                    Arreglo[j] = Arreglo[j+1];
                    Arreglo[j+1] = aux;
                }
            }
        }
    }
    
    /**
     * La funcion busqueda binaria se encarga de realizar un metodo de busqueda de datos, en este caso separando de mitad en mitad hasta encontrar el dato: me ayudo este video https://www.youtube.com/watch?v=1CnV4iajh-k
     * @param deportist deportist es el objeto con datos que se comparara con la variable datos que tambien se recibio
     * @param dato es la variable a la que queremos comparar si existe dentro del array
     * @param c un criterio de comparacion 
     * @param x El dato recibido de un deportista random    
     * @param c1 un criterio de comparacion
     * @return retorna un indice en donde el dato y lo que contenia el objeto coincidieron
     */
    public static int BBin(Object[] deportist, Object dato ,cmp c, getDeportista x, cmp c1){
        int n = deportist.length;
        int mid,inf=0,sup=n-1;
        while(inf<=sup){
            mid = (inf+sup)/2;
            if(c1.cmp(x.GET((Deportista)deportist[mid]), dato)) return mid;
            else if(c.cmp(dato, x.GET((Deportista)deportist[mid]))){
                sup = mid-1;
            }else{
                inf = mid+1;
            }
        }
        return -1;
    }
    
    /**
     * La funcion eliminar como su nombre lo indica elimina un dato en el array, comunmente se usa en conjunto con busqueda para eliminar a alguien en especifico, de igual forma se puede mandar llamar pasandole un array y el indice del que se quiere eliminar
     * @param deportistas es un array de deportistas
     * @param n es la variable indice la cual elimina a ese sujeto especificamente
     * @return retorna el nuevo array sin ese deportista
     */
    public static Deportista[] Eliminar(Deportista[] deportistas,int n){
        if (deportistas == null || n >= deportistas.length || n < 0 ) { //Esto evita que no se tenga ningun dato y se intente alguna situacion rara, por ejempo si esta en nulo si es menor a cero o si es mayor o igual al tamaño maximo del array
            return deportistas; 
        } 
  
        Deportista[] ArrayActualizado = new Deportista[deportistas.length - 1]; 
  
        for (int i = 0, k = 0; i < deportistas.length; i++) { 
            if (i == n) { 
                continue; 
            } 
            ArrayActualizado[k++] = deportistas[i]; 
        } 
        return ArrayActualizado; 
    }

    /**
     * Esta funcion se encarga de actualizar los datos de uno de los deportistas
     * @param deportistas deportistas es el array de deportistas
     * @param x es el valor que retorno la busqueda, en la cual si se eocntro un deportista podra poder actualizarse
     * @return retorna un array actualizado con el nuevo deportista, donde se manda a llamar debe referenciar a el array deportista
     */
    public static Deportista[] ActualizarDeportista(Deportista[] deportistas, int x){
        Deportista localdeportista = new Deportista();
        System.out.print("INGRESE NUEVO NOMBRE");
        localdeportista.setNombre(in.nextLine().toString());
        System.out.print("INGRESE NUEVA EDAD");
        localdeportista.setEdad(Integer.parseInt(in.nextLine()));
        System.out.print("INGRESE NUEVO TIPO DE ATLETA");
        localdeportista.setDeporte(in.nextLine().toString());
        System.out.print("INGRESE MEJOR PRUEBA");
        localdeportista.setMejorprueba(in.nextLine().toString());
        System.out.print("INGRESE MEJOR TIEMPO");
        localdeportista.setMejortiempo(in.nextLine().toString());
        
        if (deportistas == null || x < 0 || x >= deportistas.length) { 
            return deportistas; 
        } 
  
        Deportista[] ArrayActualizado = new Deportista[deportistas.length]; 
  
        for (int i = 0; i < deportistas.length; i++) {  
            if (i == x) { 
                ArrayActualizado[i] = localdeportista;
            } else
                ArrayActualizado[i] = deportistas[i]; 
        } 
        return ArrayActualizado; 
    }
 
    /**
     * Esta funcion se encarga de esperar a que el usuario pulse una tecla para continuar
     */
    public static void WaitingLine(){
        System.out.println("Presione una tecla para continuar...");
        new java.util.Scanner(System.in).nextLine();
    }
}