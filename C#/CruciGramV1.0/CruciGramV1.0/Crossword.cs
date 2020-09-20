﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace CruciGramV1._0
{
    public partial class Crossword : Form
    {
        int contadrr; //ES GLOBAL PORQUE GUARDA EL NUMERO DE VISUALES AGREGADOS AL FORM DINAMICAMENTE
        int nTextBox=20;

        public class Palabra
        {
            public int Dificultad = 0;
            public bool orientacion;
            public bool activo;
            public string sPalabra;
            public string sDefinicion;
            public int nXCoordenadaInicio = 0;
            public int nXCoordenadaFin = 0;
            public int nYCoordenadaInicio = 0;
            public int nYCoordenadaFin = 0;
            //void Palabra(int a, bool b, char palabra[]);
        }

        public class Interseccion
        {
            public int interseccionX = 0;
            public int interseccionY = 0;
        }

        public Crossword(int x)
        {
            Palabra constructor = new Palabra();
            Random random = new Random();
            InitializeComponent();
            switch (x)
            {
                case 1:
                    labeldificultad.Text = "Facil";
                    x = 4;
                    break;

                case 2:
                    labeldificultad.Text = "Medio";
                    int randomNumber = random.Next(6, 8);
                    x = randomNumber;
                    break;
                    

                case 3:
                    labeldificultad.Text = "Dificil";
                    int randomNumber1 = random.Next(9, 19);
                    x = randomNumber1;
                    break;

                default:break;
            }
            generarCrucigramas(x);
            x = 0;
        }

        private void Crossword_Load(object sender, EventArgs e)
        {
        }

        public void generarCrucigramas(int difficulty)
        {
            Palabra[] aPalabra = new Palabra[100]; //Generamos un arreglo de objetos palabra
            Interseccion[] aInterseccion = new Interseccion[100];
            //int[] interseccion= new int[30];
            int[] nNumerosUsados = new int[100];
            int tamaño = 0, x = 400, y = 300, generacion = 0, labels = 1, h = 1,v=0,vv=0, difficulty_=difficulty, apuntador=0, apuntadorpivote=0; //variables en uso
            int indice = 0; //Numero total de palabras
            List<string> listaUsados = new List<string>();

            ///////////////////////////////////LEEMOS NUESTRO ARCHIVO DE TEXTO Y GUARDAMOS TODOS SUS ATRIBUTOS EN EL ARREGLO DE OBJETO PALABRA//////////////////////////
            #region LECTURA DE DATOS
            using (StreamReader leer = new StreamReader(@"C:\Users\carlo\OneDrive\Documentos\Visual Studio 2012\Projects\CruciGramV1.0\CruciGramV1.0\Resources\diccionario.txt"))
            {
                while (!leer.EndOfStream) //lo repetira hasta el final del archivo
                {
                    string str = leer.ReadLine();
                    String[] separator = { "," }; //Aqui definimos el separador
                    Int32 count = 3; //Contamos 3 separaciones para ejecutar el stringlist
                    String[] strlist = str.Split(separator, count, StringSplitOptions.RemoveEmptyEntries); //Partimos el string leido anteriormente
                    /////////////////////////////SE LEEN LAS palabras, definicion y dificultad Y SE GUARDAN POR UN INDICE//////////////////////////////
                    aPalabra[indice] = new Palabra();
                    aPalabra[indice].sPalabra = strlist[0]; //Guardamos el atributo palabra en el arreglo de palabras en la posicion indice
                    aPalabra[indice].sDefinicion = strlist[1]; //Guardamos el atributo defnicion en el arreglo de palabras en la posicion indice
                    aPalabra[indice].Dificultad = Int32.Parse(strlist[2]); //Guardamos el atributo dificultad en el arreglo de palabras en la posicion indice
                    aPalabra[indice].activo = false; //Definimos la orientacion por defecto en horizontal false = horizontal true = vertical
                    indice++; //Incrementamos el indice para ir guardando palabra por palabra leida
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                }
                leer.Close(); //Cerramos la apertura del diccionario
            }
            #endregion

            #region GENERACION DE INDICES RANDOM
            Random random = new Random();
            for (int r = 0; r < indice; r++)
            {
                int randomNumber = random.Next(0, indice+1);//GENERAMOS UN NUMERO RANDOM ENTRE 1 Y EL ULTIMO VALOR DE INDICE DE NUESTRO DICCIONARIO
                if (!nNumerosUsados.Contains(randomNumber)) //SI CONTIENE EL NUMERO RANDOM NO REPETIDO EN ALGUNA POSICION ENTRA AQUI
                {
                    nNumerosUsados[r] = randomNumber; //GUARDAMOS EL NUMERO EN EL ARREGLO DE LOS NUMEROS A USAR
                }
                else //SI CONTIENE EL NUMERO RANDOM REPETIDO EN ALGUNA POSICION ENTRA AQUI Y REGRESA HASTA QUE YA NO SE REPITA
                {
                    r--;
                }
            }
            #endregion
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<AQUI GENERAMOS TODOS LOS TEXTBOX GRAFICOS DE ACUERDO A LA DIFICULTAD>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            #region GENERACION DE TODOS LOS VISUALES DE ACUERDO A DIFICULTAD

            for (int nGraphics = 0; nGraphics <= difficulty_; nGraphics++)
            {
                #region GENERACION HORIZONTAL O VERTICAL
                if (nGraphics > 0)
                {
                    switch (generacion)
                    {
                        case 0:
                            aPalabra[(nNumerosUsados[apuntador]) - 1].orientacion = true;
                            generacion++;
                            break;

                        case 1: 
                            generacion--;
                            break;

                        default: break;
                    }
                    /*if (aPalabra[(nNumerosUsados[apuntadorpivote]) - 1].orientacion == false)//Generamos si sera vertical u horizontal
                    {
                        aPalabra[(nNumerosUsados[apuntador]) - 1].orientacion = true;
                    }
                     * */
                }
                #endregion

                #region ES VERTICAL

                if (aPalabra[(nNumerosUsados[apuntador]) - 1].orientacion == true) //SI LA ORIENTACION ES TRUE SIGNIFICA QUE ES VERTICAL
                {
                        //aInterseccion[nGraphics] = new Interseccion();
                        int xtmp = 0, ytmp = 0;  
                        bool escribir = false;

                        #region ACOMODA XY BUSCALETRA
                        do
                        {
                            tamaño = aPalabra[(nNumerosUsados[apuntador]) - 1].sPalabra.Length; //Se lee el tamaño de la palabra que se selecciono en la pos x
                            int tamañoAnterior = aPalabra[(nNumerosUsados[(apuntador - 1)] - 1)].sPalabra.Length;
                            xtmp = tamañoAnterior * 15;
                            x = x - xtmp;
                            xtmp = 0;
                            apuntadorpivote = apuntador;
                            
                            for (int a = 0; a < tamañoAnterior; a++) //Se repetira el proceso de creacion de textbox hasta que encuentre la letra igual
                            {
                                for (int aa = 0; aa < tamaño; aa++)//Se repite letra por letra de acuerdo a la letra por letra de la palabra anterior
                                {
                                    if (aPalabra[(nNumerosUsados[apuntador - 1]) - 1].sPalabra[a] == aPalabra[(nNumerosUsados[apuntador]) - 1].sPalabra[aa] && escribir == false /* && (x != aInterseccion[nGraphics-1].interseccionX)*/)
                                    {
                                        escribir = true;
                                        y = y - ytmp;
                                        x = x + xtmp;

                                        //aInterseccion[nGraphics].interseccionX = x;
                                        //aInterseccion[nGraphics].interseccionY = y + ytmp;
                                    }
                                    ytmp = ytmp + 15;
                                    //nEspInter++;
                                }
                                //nEspInter = 0;
                                ytmp = 0;
                                xtmp += 15;
                            }
                            xtmp = 0;
                            ytmp = 0;
                            apuntador++;
                        }while (escribir == false);
                        #endregion

                        #region GENERAR CADENA DE TEXTBOX DE LA PALABRA
                        for (int a = 0; a < tamaño; a++)
                        {
                            #region Numerito
                            if (a == 0){
                                Label numerito = new Label();
                                numerito.Width = 10;
                                if (nGraphics>=9)
                                {
                                    numerito.Width = 13;
                                }
                                numerito.Height = 10;
                                numerito.Location = new Point(x, y-10);
                                numerito.BackColor = Color.FromArgb(255, 0, 0);
                                numerito.Text = nGraphics + 1 + "";
                                numerito.Font = new Font("Tahoma", 4, FontStyle.Bold);
                                numerito.Name = "label" + labels.ToString();
                                panel1.Controls.Add(numerito);
                                labels++;
                            }
                            #endregion

                            aPalabra[(nNumerosUsados[apuntador]) - 1].nXCoordenadaInicio = (x);
                            aPalabra[(nNumerosUsados[apuntador]) - 1].nYCoordenadaInicio = (y);
                            TextBox letra = new TextBox();
                            letra.Width = 15;
                            letra.Height = 15;
                            letra.MaxLength = 1;
                            letra.Location = new Point(aPalabra[(nNumerosUsados[apuntador]) - 1].nXCoordenadaInicio, aPalabra[(nNumerosUsados[apuntador]) - 1].nYCoordenadaInicio);
                            //letra.Text = "" + aPalabra[(nNumerosUsados[apuntadorpivote]) - 1].sPalabra[a];
                            letra.Font = new Font("Tahoma", 6, FontStyle.Bold);
                            letra.Name = "textBox" + nTextBox.ToString();
                            panel1.Controls.Add(letra);
                            nTextBox++;
                            y += 15;
                        }
                        #endregion

                        #region GENERAR DEFINICION
                        Label descripcion = new Label();
                        descripcion.Width = 250;
                        descripcion.Height = 15;
                        descripcion.Location = new Point(1, vv);
                        descripcion.Text = nGraphics + 1 + ".- " + aPalabra[(nNumerosUsados[apuntadorpivote]) - 1].sDefinicion;
                        descripcion.Font = new Font("Tahoma", 5, FontStyle.Bold);
                        descripcion.Name = "label" + labels.ToString();
                        panel3.Controls.Add(descripcion);
                        labels++;
                        vv += 15;
                        listaUsados.Add("" + aPalabra[(nNumerosUsados[apuntador]) - 1]); //Añadimos directamente a la lista con el indice apuntador
                        #endregion
                }
                #endregion

                #region ES HORIZONTAL

                else if (aPalabra[(nNumerosUsados[apuntador]) - 1].orientacion == false) //SI LA ORIENTACION ES FALSE SIGNIFICA QUE ES HORIZONTAL
                {
                    //aInterseccion[nGraphics] = new Interseccion();
                    if (apuntador == 0)
                    {
                        tamaño = aPalabra[(nNumerosUsados[apuntador]) - 1].sPalabra.Length;
                        for (int a = 0; a < tamaño; a++)
                        {
                            #region Numerito
                            if (a == 0)
                            {
                                Label numerito = new Label();
                                numerito.Width = 10;
                                numerito.Height = 10;
                                numerito.Location = new Point(x-10, y);
                                numerito.BackColor = Color.FromArgb(255, 0, 0);
                                numerito.Text = nGraphics + 1 + "";
                                numerito.Font = new Font("Tahoma", 4, FontStyle.Bold);
                                numerito.Name = "label" + labels.ToString();
                                panel1.Controls.Add(numerito);
                                labels++;
                            }
                            #endregion

                            aPalabra[(nNumerosUsados[apuntador]) - 1].nXCoordenadaInicio = (x);
                            aPalabra[(nNumerosUsados[apuntador]) - 1].nYCoordenadaInicio = (y);
                            TextBox letra = new TextBox();
                            letra.Width = 15;
                            letra.Height = 15;
                            letra.Location = new Point(aPalabra[(nNumerosUsados[apuntador]) - 1].nXCoordenadaInicio, aPalabra[(nNumerosUsados[apuntador]) - 1].nYCoordenadaInicio);
                            letra.MaxLength = 1;
                            //letra.Text = "" + aPalabra[(nNumerosUsados[apuntador]) - 1].sPalabra[a];
                            letra.Font = new Font("Tahoma", 6, FontStyle.Bold);
                            letra.Name = "textBox" + nTextBox.ToString();
                            panel1.Controls.Add(letra);
                            nTextBox++;
                            x += 15;
                        }
                        apuntador++;
                    }

                    else
                    {
                        int xtmp = 0, ytmp = 0;
                        bool escribir = false;
                        do
                        {
                            tamaño = aPalabra[(nNumerosUsados[apuntador]) - 1].sPalabra.Length; //Se lee el tamaño de la palabra que se selecciono en la pos x
                            int tamañoAnterior = aPalabra[(nNumerosUsados[(apuntador - 1)] - 1)].sPalabra.Length;
                            ytmp = tamañoAnterior * 15;
                            y = y - ytmp;
                            ytmp = 0;
                            apuntadorpivote = apuntador;
                            for (int a = 0; a < tamañoAnterior; a++) //Se repetira el proceso de creacion de textbox hasta que encuentre la letra igual
                            {
                                for (int aa = 0; aa < tamaño; aa++)//Se repite letra por letra de acuerdo a la letra por letra de la palabra anterior
                                {
                                    if (aPalabra[(nNumerosUsados[apuntador - 1]) - 1].sPalabra[a] == aPalabra[(nNumerosUsados[apuntador]) - 1].sPalabra[aa] && escribir == false /*&& (y != aInterseccion[nGraphics - 1].interseccionY)*/)
                                    {
                                        escribir = true;
                                        x = x - xtmp;
                                        y = y + ytmp;
                                        //aInterseccion[nGraphics].interseccionX = x + xtmp;
                                        //aInterseccion[nGraphics].interseccionY = y;
                                    }
                                    xtmp = xtmp + 15;
                                }
                                xtmp = 0;
                                ytmp += 15;
                            }
                            xtmp = 0;
                            ytmp = 0;
                            
                            apuntador++;
                        } while (escribir == false);
               
                        
                        for (int a = 0; a < tamaño; a++)
                        {
                            if (a == 0)
                            {
                                Label numerito = new Label();
                                numerito.Width = 10;
                                if (nGraphics > 9)
                                {
                                    numerito.Width = 14;
                                }
                                numerito.Height = 10;
                                numerito.Location = new Point(x-10, y);
                                numerito.BackColor = Color.FromArgb(255, 0, 0);
                                numerito.Text = (nGraphics + 1 )+ "";
                                numerito.Font = new Font("Tahoma", 4, FontStyle.Bold);
                                numerito.Name = "label" + labels.ToString();
                                panel1.Controls.Add(numerito);
                                labels++;
                            }
                            aPalabra[(nNumerosUsados[apuntador]) - 1].nXCoordenadaInicio = (x);
                            aPalabra[(nNumerosUsados[apuntador]) - 1].nYCoordenadaInicio = (y);
                            TextBox letra = new TextBox();
                            letra.Width = 15;
                            letra.Height = 15;
                            letra.MaxLength = 1;
                            letra.Location = new Point(aPalabra[(nNumerosUsados[apuntador]) - 1].nXCoordenadaInicio, aPalabra[(nNumerosUsados[apuntador]) - 1].nYCoordenadaInicio);
                            //letra.Text = "" + aPalabra[(nNumerosUsados[apuntadorpivote]) - 1].sPalabra[a];
                            letra.Font = new Font("Tahoma", 6, FontStyle.Bold);
                            letra.Name = "textBox" + nTextBox.ToString();
                            panel1.Controls.Add(letra);
                            nTextBox++;
                            x += 15;
                        }
                    }
                    Label descripcion = new Label();
                    descripcion.Width = 250;
                    descripcion.Height = 15;
                    descripcion.Location = new Point(1, v);
                    descripcion.Text = nGraphics + 1 + ".- " + aPalabra[(nNumerosUsados[apuntadorpivote]) - 1].sDefinicion;
                    descripcion.Font = new Font("Tahoma", 5, FontStyle.Bold);
                    descripcion.Name = "label" + labels.ToString();
                    panel2.Controls.Add(descripcion);
                    labels++;
                    v += 15;
                    listaUsados.Add("" + aPalabra[(nNumerosUsados[apuntador]) - 1]); //Añadimos directamente a la lista con el indice apuntador
                }
                #endregion

            }
            #endregion
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void botonverificar_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Usted ha ganado, felicidades");
            panel1.BackColor = Color.FromArgb(120, 0, 255, 0);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            panel1.BackColor = Color.FromArgb(255, 0, 0);
            MessageBox.Show("Revise bien por favor");
            panel1.BackColor = Color.Gray;
        }
            
        }
}

