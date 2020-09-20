using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace _16300206_Placas
{
    class Program
    {
        static void Main(string[] args)
        {
            var placas = new List<string>();
            var dplacas = new List<string>();
//            var listaLote = new List<int>();
//            int[] nLote = new int[676];
//            int tempx, tempy;
            int linea = 0;
            bool SiHayDuplicados = false;
/*            for (tempx = 0; tempx < 26; tempx++)
                    for (tempy = 0; tempy < 26; tempy++ )
                        {
                            nLote[tempx *26 + tempy] = 0;
//                            Console.WriteLine( (char) (tempx + 65) + " - " + (char) (tempy + 65) + " - " + (int) (tempx * 26 + tempy));
                        }
*/
            using (StreamReader leer = new StreamReader(@"C:\Users\carlo\Desktop\sample.txt"))
            {
                while (!leer.EndOfStream)
                {
                    string x = leer.ReadLine();
                    if (x[0] == 'J' || x[0] == 'H')
                    {
                        if (Char.IsLetter((char)x[1]) && Char.IsLetter((char)x[2]))  // Verificar que son 3 letrras
                        {
                            if (placas.Contains(x) != true)
                            {
                                dplacas.Add(x);
                            }
                            else
                            {
                                SiHayDuplicados = true;
                            }
                            placas.Add(x);
                            linea++;
//                            listaLote.Add(1);
                        }
                    }
                }
            }

            placas.Sort();
            dplacas.Sort();
            foreach (string item in dplacas)
            {
//                Console.Write( "\t{0}:", item );
                int nVeces = 0;
                int nEnelLote = 0;
                string Placa_y_Lote = item.Substring(0,6);
                foreach (string x in placas)
                {
                    if (x == item)
                        nVeces++;

                    if (Placa_y_Lote == x.Substring(0, 6))
                        nEnelLote++;
                }

                Console.WriteLine(" {0}  Lote {1}  tiene {2} placa(s) y {3} presenta duplicados", 
                    Placa_y_Lote.Substring(0,3), Placa_y_Lote.Substring(4,2), nEnelLote, (nVeces>1?"-SI-":" NO "));
                SiHayDuplicados = SiHayDuplicados || nVeces > 1;    // Esta parte se prueba desde que se leen, se cambio de lugar
            }

/*            foreach( string x in placas) { 
                    if (x[0] == 'J' || x[0] == 'H')
                    {
                        if ( Char.IsLetter((char)x[1])  && Char.IsLetter((char)x[2]))     // Verificar que son 3 letrras
 //                       if ( (x[1] >= 65 && x[1] <= 90) && (x[2] >= 65 && x[2] <= 90) )  // Verificar que son 3 letrras
                        {

                                if ( (x[3] == '-') && (x[0] == 'H') )
                                {
                                    temp = ( (int)x[4] - 48) *  10 + (int)x[5] - 48;
                                    ++nLote[(((int)x[1] - 65) * 25) + ((int)x[2] - 65)];
                                    Console.WriteLine(x + " -- " + temp + " -- " + nLote[(((int)x[1] - 65) * 25) + ((int)x[2] - 65) ]);
                                }
                        }
                  }
            }
            int numerorepeticiones= 1;

            foreach (var letra in placas)
            {
                //Console.WriteLine();
                //Console.ReadLine();
                if (((letra[0] == letra[1] && letra[1] == letra[2]) ||(letra[1] == letra[2])))
                {
                    Console.WriteLine("Me repeti" + numerorepeticiones + " veces");
                    numerorepeticiones++;
                }
                else { numerorepeticiones = 1; }
                Console.WriteLine(letra);
            }
            Console.WriteLine("Hay un total de ["+ linea + "] Que tienen J o H ");
 */
            Console.WriteLine(linea + " " + (SiHayDuplicados ? " SI " : " NO ") + " hay Duplicados");
            Console.ReadLine();
        }
    }
}
