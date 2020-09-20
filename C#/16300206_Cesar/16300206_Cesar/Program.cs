using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Threading;
using System.Timers;


namespace _16300206_Cesar
{

    public class Password
    {

        private int mPassSize;
        private int mNumberOfMayus;
        private int mNumberOfSpecChars;
        private int numberOfPasswords;
        private String[] sCadenaFinal = new String[100];
        private String[] sCadenaDesencrypt = new String[100];
        private string[] lPasswords = new string[5];


        //HACEMOS EL CONSTRUCTOR E INICIALIZAMOS LAS VARIABLES
        public Password(int nPS, int nNM, int nNS, int nNPasswords)
        {
            mPassSize = (nPS == 0 ? 1 : nPS); //NO PUEDE SER 0 se le asigna automaticamente un 1 en caso de serlo, si no se convierte en el dato mandado
            mNumberOfMayus = (nNM > nPS ? 0 : nNM); //DEBE SER MENOR A mPassSize
            mNumberOfSpecChars = nNS; //DEBE SER MENOR A mPassSize
            numberOfPasswords = nNPasswords;
            generatePassword(numberOfPasswords);
        } //CONSTRUCTOR DE NUESTRO PROGRAMA

        private int generatePassword(int nPass)
        {

            int nMay = mNumberOfMayus;
            int nCarSpec = mNumberOfSpecChars;
            Random rand = new Random();
            //NO USAMOS VALIDCHARS A MENOS QUE USEMOS EL CODIGO VIEJO 
            char[] cValidChars = { '!', '"', '#', '$', '%', '&', '_', '(', ')', '*', '+', ',', '-', '.', '/', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?', '@', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[', '_', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~' };
            //EN CASO DE USAR TAMBIEN EL OTRO ALGORITMO
            int nCTemp = 0;


            //HACEMOS TRES FORS QUE NOS PERMITIRAN VER LOS VALORES QUE LLEGAN Y CONVERTIRLO AL FINAL EN UNA CADENA STRING

            for (int i = 0; i < nPass; i++)
            {  // ESCRIBIRA EN EL PASSWORD EL VALOR DE cada caracter generado

                string sCaracterGenerado = String.Empty;
                string sMayusculaGenerado = String.Empty;
                string sNormalGenerado = String.Empty;

                for (int j = 0; j < mNumberOfSpecChars; j++)
                {
                    //Randomizamos un numero ASCII con cualquiera en el rango de los caracteres especiales
                    int nCaracterRandom = rand.Next(33, 47);
                    sCaracterGenerado = sCaracterGenerado + Convert.ToChar(nCaracterRandom);
                }

                for (int j = 0; j < mNumberOfMayus; j++)
                {
                    //Randomizamos un numero ASCII con cualquiera en el rango de las mayusculas
                    int nMayusculaRandom = rand.Next(65, 90);

                    sMayusculaGenerado = sMayusculaGenerado + Convert.ToChar(nMayusculaRandom);
                }

                for (int c = 0; c < (mPassSize - (mNumberOfSpecChars + mNumberOfMayus)); c++)
                {
                    //Randomizamos un numero ASCII con cualquiera en el rango de las minusculas
                    //int nCTemp1 = rand.Next(cValidChars.Length);
                    int nCTemp2 = rand.Next(97, 122);
                    sNormalGenerado = sNormalGenerado + Convert.ToChar(nCTemp2);
                }

                //AQUI CONCATENAMOS TODOS LOS STRINGS QUE ANTERIORMENTE ERAN VALORES CHAR
                sCadenaFinal[i] = sNormalGenerado + sMayusculaGenerado + sCaracterGenerado;

                //ESCRIBIMOS LA CADENA
                //Console.WriteLine(sCadenaFinal[i]);
            }


            /*           ---------------------------------CODIGO VIEJITO------------------------------------------
                      for (int c = 0; c < nPass; c++)
                       {
                          Console.WriteLine(sCadenaFinal[c]);
                           Console.ReadLine();
                      }
          
                      }*/
            /*
            for (int i = 0; i < nPass; i++)
            {  // Num passwords
                for (int c = 0; c < mPassSize; c++)
                {
                    nCTemp = rand.Next(cValidChars.Length);
                    if ((nCTemp >= 0 && nCTemp <= 14) || (nCTemp >= 25 && nCTemp <= 31) || (nCTemp >= 58 && nCTemp <= 63) || (nCTemp >= 90 && nCTemp <= 94))
                    {
                        if (nCarSpec > 1)
                            nCarSpec--;
                        else
                        {
                            do
                            {
                                nCTemp = rand.Next(cValidChars.Length);
                            } while ((nCTemp >= 0 && nCTemp <= 14) || (nCTemp >= 25 && nCTemp <= 31) || (nCTemp >= 58 && nCTemp <= 63) || (nCTemp >= 90 && nCTemp <= 94));
                        }
                    }

                    if (nCTemp >= 32 && nCTemp <= 57)
                    {
                        if (nMay > 1)
                            nMay--;
                        else
                        {
                            do
                            {
                                nCTemp = rand.Next(cValidChars.Length);
                            } while (nCTemp >= 32 && nCTemp <= 57);
                        }
                    }
                    if (nCTemp >= 64 && nCTemp <= 89)
                    {
                        if ((mPassSize - (nCarSpec + nMay)) > 0)
                        {
                            do
                            {
                                nCTemp = rand.Next(cValidChars.Length);
                            } while (nCTemp < 64 && nCTemp > 89);
                        }
                    }
                    Console.Write(cValidChars[nCTemp]);
                }
                Console.ReadLine();
                nMay = mNumberOfMayus;
                nCarSpec = mNumberOfSpecChars;
            }*/
            return 0;
        } //GENERA LOS PASSWORDS DE ACUERDO A LOS VALORES QUE LE DIMOS AL CONSTRUCTOR

        public int encryptPasswds(int interval)
        {
            byte fase = (byte)interval;
            string sCadenaDes = String.Empty;
            Console.WriteLine("MOSTRANDO LOS PASSWORDS ENCRIPTADOS CON CESAR");
            //HARA ESTE FOR DE ACUERDO AL NUMERO DE PASSWORDS QUE SELECCIONAMOS AL PRINCIPIO
            for (int c = 0; c < numberOfPasswords; c++)
            {
                Console.WriteLine(sCadenaFinal[c]);
                //CONVERTIMOS A CHAR ARRAY PARA QUE PODAMOS MODIFICARLO LETRA POR LETRA
                char[] charArr = sCadenaFinal[c].ToCharArray();
                //POR CADA LETRA DENTRO DEL ARREGLO
                foreach (char ch in charArr)
                {
                    //AQUI HACEMOS LA MAGIA DE INCREMENTAR EL VALOR DEL INTERVALO
                    byte val = (byte)ch;
                    val += fase;
                    char cesar = (char)val;
                    sCadenaDes = sCadenaDes + cesar;
                }
                sCadenaDesencrypt[c] = sCadenaDes;
                Console.WriteLine(sCadenaDesencrypt[c]);
                sCadenaDes = String.Empty;
                Console.ReadLine();
            }
            return 0;
        } //SE ENCARGA DE ENCRIPTAR LA CADENA sCadenaFinal Y GENERAR UNA NUEVA LLAMADA sCadenaDesencrypt

        public int decryptPasswds(int interval)
        {
            string sCadenaDes = String.Empty;
            String[] Cadenita = new String[100];
            Console.WriteLine("MOSTRANDO LOS PASSWORDS DESENCRIPTADOS CON CESAR");
            //HARA ESTE FOR DE ACUERDO AL NUMERO DE PASSWORDS QUE SELECCIONAMOS AL PRINCIPIO
            for (int c = 0; c < numberOfPasswords; c++)
            {
                //CONVERTIMOS A CHAR ARRAY PARA QUE PODAMOS MODIFICARLO LETRA POR LETRA
                char[] charArr = sCadenaDesencrypt[c].ToCharArray();
                //POR CADA LETRA DENTRO DEL ARREGLO
                foreach (char ch in charArr)
                {
                    //AQUI HACEMOS LA MAGIA DE DECREMENTAR EL VALOR DEL INTERVALO
                    int val = (int)ch;
                    val -= interval;
                    char cesar = (char)val;
                    sCadenaDes = sCadenaDes + cesar;
                }
                Cadenita[c] = sCadenaDes;
                sCadenaDes = String.Empty;
                Console.WriteLine(Cadenita[c]);
                Console.ReadLine();
            }
            return 0;
        } //SE ENCARGA DE DESENCRIPTAR LA CADENA sCadenaDesencrypt Y MOSTRAR UNA CADENA DE DESENCRIPTADO

        public void mostrarPasswords()//MUESTRA LOS PASSWORDS GENERADOS POR generatepassword()
        {
            int selectIntervalo = 0, interval = 3;
            Password cListaPass = new Password(mPassSize, mNumberOfMayus, mNumberOfSpecChars, numberOfPasswords);
            Console.Clear();
            Console.WriteLine("MOSTRANDO LOS PASSWORDS");
            for (int c = 0; c < numberOfPasswords; c++)
            {
                Console.WriteLine(sCadenaFinal[c]);
                Console.ReadLine();
            }

            Console.WriteLine("ESTA PROCEDIENDO A ENCRIPTAR CON CESAR (INTERVALO DE 3)");
            Console.WriteLine("QUIERE SELECCIONAR SU INTERVALO? [1]SI [2]NO");
            selectIntervalo = Convert.ToInt32(Console.ReadLine());
            switch (selectIntervalo)
            {
                case 2:
                    Console.WriteLine("USANDO POR DEFECTO (3)");
                    Console.ReadLine();
                    encryptPasswds(3);
                    decryptPasswds(3);
                    break;

                case 1:
                    Console.WriteLine("INGRESE EL INTERVALO DESEADO (MAX 6)");
                    interval = Convert.ToInt32(Console.ReadLine());
                    if (interval > 6)
                    {
                        Console.WriteLine("NO DEBE SER MAYOR A 6. USANDO POR DEFECTO (3)");
                        Console.ReadLine();
                        encryptPasswds(3);
                        decryptPasswds(3);
                    }
                    else
                    {
                        Console.WriteLine("USANDO INTERVALO DE: " + interval);
                        Console.ReadLine();
                        encryptPasswds(interval);
                        decryptPasswds(interval);
                    }
                    break;

                default:
                    Console.WriteLine("SE EQUIVOCO, USANDO POR DEFECTO (3)");
                    break;
            }


        }
    }

    class Program
    {

        static void Main(string[] args)
        {
            int nTamañoAVerificar;
            int nPasswds, nTam, nMS, nCS = 0;
            //--------------------------------------------------------------------------
            do
            { //Repite el programa infinitamente
                //               leerDatos(); //Aqui es donde se piden los valores que se tomaran para generar los passwords a encriptar
                Console.Clear();
                Console.WriteLine("B I E N V E N I D O\n");
                Console.WriteLine("Cuantos passwords desea generar?"); //Numero de passwords generados con las especificaciones dadas
                nPasswds = Convert.ToInt32(Console.ReadLine());

                Console.WriteLine("De que tamaño será cada password?"); //Tamaño de la cadena de caraceteres a generar
                nTam = Convert.ToInt32(Console.ReadLine());
                nTamañoAVerificar = nTam;

                Console.WriteLine("Cuántas mayúsculas debo poner en los passwords? MAXIMO: " + nTamañoAVerificar); //Numero que se tiene que poner de mayusculas a fuerzas en el pass
                nMS = Convert.ToInt32(Console.ReadLine());

                //AQUI VERIFICAMOS SI HAY MAS MAYUSCULAS QUE TAMAÑO DEL PASSWORD, SI ES ASI SOLAMENTE PONEMOS EL VALOR MAXIMO DEL TAMAÑO DEL PASS
                if (nMS > nTamañoAVerificar)
                {
                    Console.WriteLine("Usted puso un numero mayor de mayusculas que el tamaño del password");
                    Console.WriteLine("No se preocupe, se ha ajustado el valor de mayusculas a generar a el tamaño del password");
                    Console.WriteLine("PRESIONE UNA TECLA PARA CONTINUAR");
                    Console.ReadLine();
                    nMS = nTam;
                }
                //AQUI CONFIRMAREMOS QUE NO ESTA TOMADO YA TODA LA CADENA POR MAYUSCULAS
                //EN CASO DE ESTAR TOMADO POR COMPLETO POR MAYUSCULAS PONDRA EL VALOR DE 0 A CARACTERES ESPECIALES A GENERAR
                if (nMS == nTamañoAVerificar)
                {
                    Console.WriteLine("Lo siento ya no hay espacio para caracteres especiales :( Asi que sera [0]");
                }
                //EN CASO DE TENER ESPACIOS DISPONIBLES AHORA LEERA CARACTERES ESPECIALES
                else
                {
                    //AQUI LEEREMOS EL NUMERO DE CARACTERES ESPECIALES
                    Console.WriteLine("Cuantos caracteres especiales puedo poner en el password? MAXIMO: " + (nTam - nMS));
                    nCS = Convert.ToInt32(Console.ReadLine());
                    //SI EL NUMERO DE CARACTERES ESPECIALES ES MAYOR AL TAMAÑO RESTANTE ENTONCES EL NUMERO DE CARACTERES ESPECIALES SERA IGUAL AL ESPACIO
                    //RESTANTE EN LA RESTA DEL TAMAÑO Y LAS MAYUSCULAS
                    if (nCS > nTam - nMS)
                    {
                        Console.WriteLine("Usted puso un numero mayor de caracteres especiales que tenia permitido");
                        Console.WriteLine("No se preocupe, se ha ajustado el valor de especiales a generar a el tamaño maximo restante");
                        Console.WriteLine("PRESIONE ENTER PARA CONTINUAR...");
                        nCS = nTam - nMS;
                        Console.ReadKey();
                    }
                }

                Password cListaPass = new Password(nTam, nMS, nCS, nPasswds);

                //Aqui es donde nos dirigiremos a mostrar nuestras password a partir de haber generado una cadena con los passwords generados
                cListaPass.mostrarPasswords();
                // cListaPass.mostrarDatos(cListaPass);
                Console.WriteLine("TERMINO EL PROGRAMA");
                Console.ReadKey();
            } while (true);
        }

    }
}