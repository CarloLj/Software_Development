using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EncriptacionCesar
{
    class Program
    {
        class Password
        {
            private int mPassSize;
            private int mNumberOfMayus;
            private int mNumberOfSpecChars;
            private int mNumberOfMinus;
            private int mNumberOfPasswords;
            private string mGroupOfPass;
            private string mGroupOfEncrypt;
            public char delimiter;


            public Password(int w, int x, int y, int z)
            {
                mNumberOfPasswords = w;
                mPassSize = x;
                mNumberOfMayus = y;
                mNumberOfSpecChars = z;
                mNumberOfMinus = x - y - z;
                delimiter = '|';
            }

            private string generatePassword(int numberOfPasswords)
            {
                int numeroConstrasenas = numberOfPasswords;

                //Declaramos una variable para la contrasena temporal y la final a generar
                string generatedPassword = string.Empty;
                string newPassword = string.Empty;

                //Declaramos una variable aleatoria para escoger de los diferentes rangos
                Random randomValue = new Random();
                do
                {
                //Declaramos strings para cada tipo de caracter por separado
                string generatedMayus = string.Empty;
                string generatedMinus = string.Empty;
                string generatedSpecial = string.Empty;

                //Declaramos la variable aleatoria equivalente a ascii segun el tipo de caracter
                //Se incluye un numero mas a la cota superior, ya que Random no la incluye

                    for (int j = 0; j < mNumberOfSpecChars; j++)
                    {
                        //Declaramos la variable aleatoria equivalente a ascii para Caracteres Especiales
                        int specialCharacters = randomValue.Next(33, 65);

                        generatedSpecial = generatedSpecial + Convert.ToChar(specialCharacters);
                    }
                    for (int i = 0; i < mNumberOfMayus; i++)
                    {
                        //Declaramos la variable aleatoria equivalente a ascii para Caracteres Mayusculas
                        int capsCharacters = randomValue.Next(65, 91);

                        generatedMayus = generatedMayus + Convert.ToChar(capsCharacters);
                    }
                    for (int k = 0; k < mNumberOfMinus; k++)
                    {
                        //Declaramos la variable aleatoria equivalente a ascii para Caracteres Minusculas
                        int lowsCharacters = randomValue.Next(97, 123);

                        generatedMinus = generatedMinus + Convert.ToChar(lowsCharacters);
                    }
                    //Concatenamos los caracteres de cada uno de nuestros tipos de caracter e un solo string
                    newPassword = generatedMayus + generatedSpecial + generatedMinus;

                    //Concatenamos los passwords que se van generando en uno solo, delimitando entre cada uno con "|"
                    generatedPassword = generatedPassword + newPassword + delimiter;

                    //Repetimos el ciclo hasta que se genere la cantidad correcta de contraseñas
                    numeroConstrasenas--;

                }while(numeroConstrasenas>0);

                //Retornamos las contraseñas concatenadas
                return generatedPassword;
            }

            public void getSplittedPassword()
            {
                //Toma la string retornada de generatePassword() y la escribe
                string nonSplittedPassword= generatePassword(mNumberOfPasswords);
                mGroupOfPass = nonSplittedPassword;

                //Declaramos un arreglo de strings en el que guardamos nuestras contraseñas ya separadas por el delimitador
                string[] splittedPasswords = nonSplittedPassword.Split(delimiter);

                //Damos un salto de  linea entre cada posicion del arreglo de strings y las escribimos en la consola
                foreach (var individualPassword in splittedPasswords)
                {
                    System.Console.WriteLine(individualPassword);
                }
            }

            public void encryptPasswds(int interval)
            {
                //Declaramos un String Vacio para guardar nuestros caracteres
                string nonSplittedEncrypt = "";

                //Declaramos un arreglo de caracteres en el que introducimos todo nuestro string de contraseñas
                char[]characterGroupOfPass = mGroupOfPass.ToCharArray();

                //Guardamos en un int la suma individual de nuestros caracteres mas el delimitador
                foreach (var individualCharacterIn in characterGroupOfPass)
                {
                    int x = Convert.ToInt32(individualCharacterIn) + interval;

                    //Convertimos nuestros caracteres int a objetos char
                    nonSplittedEncrypt = nonSplittedEncrypt + (Convert.ToChar(x));
                }
                //Guardamos el grupo encriptado en una variable privada de la clase para posterior uso
                mGroupOfEncrypt = nonSplittedEncrypt;

                //Declaramos un arreglo de strings en el que guardamos nuestras encriptaciones ya separadas por el delimitador + el intervalo
                string[] splittedEncrypt = nonSplittedEncrypt.Split(delimiter += (char)interval);

                //Damos un salto de  linea entre cada posicion del arreglo de strings y las escribimos en la consola
                foreach (var individualEncrypt in splittedEncrypt)
                {
                    System.Console.WriteLine(individualEncrypt);
                }
            }

            public void decryptPasswds(int interval)
            {
                //Declaramos un String Vacio para guardar nuestros caracteres
                string nonSplittedDecrypt="";

                //Declaramos un arreglo de caracteres en el que introducimos todo nuestro string de contraseñas
                char[] characterGroupOfEncrypt = mGroupOfEncrypt.ToCharArray();

                //Guardamos en un int la suma individual de nuestros caracteres menos el delimitador
                foreach (var individualCharacterOut in characterGroupOfEncrypt)
                {
                    int y = Convert.ToInt32(individualCharacterOut) - interval;

                    //Convertimos nuestros caracteres int a objetos char
                    nonSplittedDecrypt = nonSplittedDecrypt + (Convert.ToChar(y));
                }
                //Declaramos un arreglo de strings en el que guardamos nuestras encriptaciones ya separadas por el delimitador - el intervalo
                string[] splittedDecrypt = nonSplittedDecrypt.Split(delimiter -= (char)interval);

                //Damos un salto de  linea entre cada posicion del arreglo de strings y las escribimos en la consola
                foreach (var individualDecrypt in splittedDecrypt)
                {
                    System.Console.WriteLine(individualDecrypt);
                }
            }

            public void askParameters()
            {
                //Declaramos las 4 variables que seran los parametros de nuestra clase Password
                int mCantidadContrasena, mTamanoContrasena, mNumeroMayusculas, mNumeroCaracSpecial;
            askAmmount:
                Console.WriteLine("Cuantos passwords desea generar?");
                mCantidadContrasena = Convert.ToInt32(Console.ReadLine());
                //Comprobamos que las contraseñas a crear sean por lo menos 1
                if (mCantidadContrasena < 1)
                {
                    Console.WriteLine("No es posible. Error Ammount<1");
                    goto askAmmount;
                }
            askSize:
                Console.WriteLine("De que tamaño será cada password?");
                mTamanoContrasena = Convert.ToInt32(Console.ReadLine());
                //Comprobamos que el tamaño de las contraseñas a crear sean por lo menos 1
                if (mTamanoContrasena < 1)
                {
                    Console.WriteLine("No es posible. Error Size<1");
                    goto askSize;
                }
            askMayus:
                Console.WriteLine("Cuántas mayúsculas debo poner en los passwords?");
                mNumeroMayusculas = Convert.ToInt32(Console.ReadLine());
                //Comprobamos que el tamaño de las contraseñas sea mayor al de mayusculas deseadas
                if (mNumeroMayusculas > mTamanoContrasena)
                {
                    Console.WriteLine("No es posible. Error Mayus>Size");
                    goto askMayus;
                }
            askSpec:
                Console.WriteLine("Cuántos caracteres especiales debo poner en los passwords?");
                mNumeroCaracSpecial = Convert.ToInt32(Console.ReadLine());
                //Comprobamos que el tamaño de las contraseñas sea mayor al de especiales deseados
                if (mTamanoContrasena < (mNumeroMayusculas + mNumeroCaracSpecial))
                {
                    Console.WriteLine("No es posible. Error Mayus+Spec>Size");
                    goto askSpec;
                }
                //Declaramos un objeto de tipo password con sus 4 parametros ya con un valor
                Password obj1 = new Password(mCantidadContrasena, mTamanoContrasena, mNumeroMayusculas, mNumeroCaracSpecial);
                //Invocamos nuestro metodo que obtiene las contrasenas del metodo privado, las separa y las escribe en consola
                Console.WriteLine("Contrasenas Aleatorias: ");
                Console.WriteLine();
                obj1.getSplittedPassword();
                //Invocamos nuestro metodo de encriptacion
                Console.WriteLine("Contrasenas Encriptadas: ");
                Console.WriteLine();
                obj1.encryptPasswds(3);
                //Invocamos nuestro metodo de desencriptacion
                Console.WriteLine("Contrasenas Desncriptadas: ");
                Console.WriteLine();
                obj1.decryptPasswds(3);
            }
        }
        static void Main(string[] args)
        {
            //Declaramos un objeto Password mandandole parametros vacios
            Password obj2 = new Password(0,0,0,0);
            //Invocamos nuestro metodo para pedir los parametros de la clase, y asi llenar los anteriormente vacios
            obj2.askParameters();
            Console.ReadKey();

        }
    }
}
