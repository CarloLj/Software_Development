/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filosofos;

/**
 * Mesa
 * Mesa es una clase que contiene a los 5 filosofos y se encaga de acomodar
 * las rondas, basicamente pueden comer 2 a la vez (suponiendo que se tardan el
 * mismo tiempo comiendo y pensando), puede comer 1 y se dejan 2 filofos de 
 * espacio entre cada filosofo que come
 * @author Angel
 */
public class Mesa {

    private static Filosofo[] filosofos; // lista de filososfos
    private static int nFilosofos; // cantidad de filosofos
    private static int currentIndex; // indice inicial, en este nos basamos
    //para saber a quien darle de comer, este indice se le suma 1 cada ronda
    //lo que indica que el filosofo en ese indice come y dos a la derecha de
    //este indice tambien come

    /**
     * Mesa
     * constructor
     * @param n numero de filosofos
     */
    public Mesa(int n){
        currentIndex = -1;
        crearFilosofos(n);
        Start();
    }
    
    /**
     * crearFilosofos
     * crea los filosofs y los conecta, pone para cada filozofo que filosofo
     * esta a la izquiera y que filozofo esta a la derecha, y cada filosofo 
     * tiene un tenedor a su derecha
     * @param n numero de filosofos
     */
    void crearFilosofos(int n){
        nFilosofos = n;
        filosofos = new Filosofo[n];
        for(int i = 0; i < n; i++){
            filosofos[i] = new Filosofo(i,this);
        }
        for(int i = 0; i < n; i++){
            if(i + 1 < n)
                filosofos[i].der = filosofos[i+1];
            else
                filosofos[i].der = filosofos[0];
            if(i - 1 > -1)
                filosofos[i].izq = filosofos[i-1];
            else
                filosofos[i].izq = filosofos[n-1];
        }
    }
    
    /**
     * Start
     * comienzan las rondas
     */
    void Start(){
       Round();
    }
    
    /**
     * Round
     * Crea las rondas, pone que filosofos comen y que filosofos piensan en base
     * a el currentIndex, tambien imprime el nuevo estado de los filosofos una
     * vez asignados
     */
    private static void Round(){

        currentIndex++;
        if(currentIndex >= nFilosofos)
            currentIndex = 0; // reiniciamos el ciclo
      
        filosofos[currentIndex].setEstado(Filosofo.FilosofoState.comiendo);
        filosofos[currentIndex].der.setEstado(Filosofo.FilosofoState.pensando);
        filosofos[currentIndex].der.der.setEstado(Filosofo.FilosofoState.pensando);
        filosofos[currentIndex].der.der.der.setEstado(Filosofo.FilosofoState.comiendo);
        filosofos[currentIndex].der.der.der.der.setEstado(Filosofo.FilosofoState.pensando);
        
        
        printFilosofos();
        
        for(int i = 0; i < nFilosofos; i++){
            filosofos[i].beginAccion(); //empieza el hilo
        }
    }
    
    /**
     * filosofoDone
     * Recibe los filosofos que ya terminaron de comer o pensar y si ya todos
     * terminaron lo que estaban haciendo, se genera otra ronda, si los que 
     * estaban comiendo ya terminaron, aqui liberan los tenedores que 
     * necesitaban
     * @param index indice del filosofoq ue ya termino su accion
     */
    static void filosofoDone(int index){
        filosofos[index].done = true;
        if(filosofos[index].estado == Filosofo.FilosofoState.comiendo){
            filosofos[index].tenedorDer.setOcupado(false);
            filosofos[index].izq.tenedorDer.setOcupado(false);
        }

        if(everyoneDone())
            Round();  
    }
    
    /**
     * everyoneDone
     * revisa si todos los filosofos ya terminaron su accion
     * @return true si todos ya terminaron y false en caso contrario
     */
    private static boolean everyoneDone(){
        for(int i = 0; i < nFilosofos; i++){
            if(!filosofos[i].done)
                return false;
        }
        return true;
    }
    
    /**
     * printFilosofos
     * Imprime la la lista de los filosofos con su estado actual y accion actual
     */
    public static void printFilosofos(){
        System.out.println();
        System.out.println("-----------------------------------------------");
        for(int i = 0; i < nFilosofos; i++){
            System.out.println(filosofos[i]);
        }
        System.out.println("-----------------------------------------------");
        System.out.println();
    }
    
}
