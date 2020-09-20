using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ATM
{
    class Cajero
    {
        private int _billetesDe20; // cantidad de billetes de 20
        private int _saldo;
        private int _tempSaldo; // es el saldo que el usuario deposita y sera sumado ya que salga de su cuenta
        private int _numeroDeUsuario;
        private string  _NIP;

        //constructor
        public Cajero()
        {
            _billetesDe20 = 500;
            start();
        }

        private void start()
        {

            do
            { //Repite el programa infinitamente 
                bienvenido(); //mensaje y pide Usuario y NIP
                if (verificar()) //Busca en el archivo de texto y comprueba los datos
                {
                    if (Cliente_o_Gerente())
                    {
                        menuCliente();
                    }
                    else
                    {
                        menuGerente();
                    }
                }
                else
                {
                    Console.WriteLine("Usuario invalido...");
                    Console.ReadKey();
                }

            } while (true);

        }

        private void bienvenido()
        {
            Console.Clear();
            Console.WriteLine("Bienvenido\n");

            Console.WriteLine("Numero de usuario:");
            _numeroDeUsuario = Convert.ToInt32(Console.ReadLine());
            

            Console.WriteLine("NIP:");
            _NIP = (Console.ReadLine());
        }

        private bool verificar()
        {
            Usuario usuario;
            using (ATMEntities db = new ATMEntities())
            {
                Encrypt encrypt = new Encrypt(); // esta clase encripta por medio de md5 para comparar las contraseñas
                usuario = db.Usuario.Where(d => d.N_Cuenta == _numeroDeUsuario).FirstOrDefault(); //regresa el usuario si existe
                if (usuario != null)
                {
                    if (encrypt.EncryptPass(_NIP).Equals(encrypt.byteToString(usuario.NIPP))) //compara contraseñas encriptadas
                    {
                        return true;//VALIDO
                    }
                }
                
            }
                return false; //INVALIDO
        }

        private bool Cliente_o_Gerente()
        {
            //determina si el usuario es cliente o gerente (no se toma en cuenta el caso de una cuenta que sea los 2)
            using (ATMEntities db = new ATMEntities())
            {
                Cliente cliente = db.Cliente.Where(d => d.N_Cuenta == _numeroDeUsuario).FirstOrDefault(); //revisa si existe el cliente
                if (cliente != null) // si existe, entonces es cliente
                {
                    _saldo = Convert.ToInt32(cliente.Saldo);
                    return true; // cliente
                }
                else // no existe en la tabla clientes por lo que es gerente
                {
                    return false; //gerente
                }
            }
        }

        private bool menuGerente()
        {
            int opc; //opcion seleccionada
            bool seguir = true; // si el usuario desea seguir en el programa o no
            do
            {

                Console.Clear();
                Console.WriteLine("Menu Gerente \n 1) N Retiros \n 2) N Depositos \n 3) $ Retiros \n 4) $ Depositos \n 5) Revisar usuario \n 6) Salir");
                opc = int.Parse(Console.ReadLine());
                /*
                 * True es para la cantidad de retiros/depositos
                 * False es para la cantidad de dinero en retiros/depositos
                 */
                switch (opc)
                {
                    case 1:
                        nRetiros(true);
                        break;
                    case 2:
                        nDepositos(true);
                        break;
                    case 3:
                        nRetiros(false);
                        break;
                    case 4:
                        nDepositos(false);
                        break;
                    case 5:
                        gerenteRevisarCliente();
                        break;
                    case 6://SALIR
                        seguir = false;
                        break;
                    default:
                        Console.WriteLine("opcion invalida...");
                        Console.ReadKey();
                        break;
                }

            } while (seguir);
            return false;
        }

        private bool menuCliente()
        {
            int opc; //opcion seleccionada
            bool seguir = true; // si el usuario desea seguir en el programa o no
            do
            {

                Console.Clear();
                Console.WriteLine("Menu Cliente \n 1) Saldo \n 2) Retirar \n 3) Depositar \n 4) Historial \n 5) Salir");
                opc = int.Parse(Console.ReadLine());

                switch (opc)
                {
                    case 1:
                        verSaldo();
                        break;
                    case 2:
                        retirarDinero();
                        break;
                    case 3:
                        depositarDinero();
                        break;
                    case 4:
                        historialCliente();
                        break;
                    case 5://SALIR
                        seguir = false;
                        _saldo += _tempSaldo;//Guarda lo que el usuario deposito a el mismo
                        guardarCambios();
                        break;
                    default:
                        Console.WriteLine("opcion invalida...");
                        Console.ReadKey();
                        break;

                }

            } while (seguir);
            return false;
        }
        
        private void guardarCambios() //guarda el saldo actual
        {
            using (ATMEntities db = new ATMEntities())
            {
                Cliente cliente = db.Cliente.Where(d => d.N_Cuenta == _numeroDeUsuario).FirstOrDefault();
                cliente.Saldo = _saldo; // actualiza el saldo
                db.Entry(cliente).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        private void verSaldo()
        {
            Consulta consulta = new Consulta(); //crea consulta para el historial
            using (ATMEntities db = new ATMEntities())
            {
                int n;
                try
                {
                    n = db.Consulta.Max(p => p.id_Consulta);
                }catch(Exception e)
                {
                    n = 1000;
                }
                consulta.id_Consulta = n + 1;
            }
            insertarTransaccion(consulta); // inserta la consulta en el historial

            Console.WriteLine("Saldo: {0}", _saldo);
            Console.ReadKey();
        }

        private void retirarDinero()
        {
            int opc; //opcion seleccionada
            int cantidadRetirar = 0;
            bool repetir = false, opcValida = true;
            do
            {
                repetir = false;
                opcValida = true;
                Console.Clear();
                Console.WriteLine(" 1) $20 \n 2) $40 \n 3) $60 \n 4) $100 \n 5) $200 \n 6) salir");
                opc = int.Parse(Console.ReadLine());

                switch (opc)
                {
                    case 1:
                    case 2:
                    case 3:
                        cantidadRetirar = 20 * opc;
                        repetir = false;
                        break;
                    case 4:
                        cantidadRetirar = 100;
                        repetir = false;
                        break;
                    case 5:
                        cantidadRetirar = 200;
                        repetir = false;
                        break;
                    case 6:
                        return;
                    default:
                        Console.WriteLine("Opcion invalida...");
                        Console.ReadKey();
                        repetir = true;
                        opcValida = false;
                        break;
                }
                if (opcValida)
                {
                    if (cantidadRetirar > _saldo) // revisa que la cantidad sea mayor al saldo
                    {
                        Console.WriteLine("Saldo insuficiente...");
                        Console.ReadKey();
                        repetir = true;
                    }
                    else if ((cantidadRetirar / 20) > _billetesDe20) // revisa que el cajero tenga billetes
                    {
                        Console.WriteLine("Cantidad de billetes insuficientes...");
                        Console.ReadKey();
                        repetir = true;
                    }
                    else if (opcValida)
                    {
                        repetir = false;
                    }
                    else
                    {
                        repetir = true;
                    }
                }

            } while (repetir);

            //correcto

            Retiro retiro = new Retiro(); // crea retiro para el historial
            using (ATMEntities db = new ATMEntities())
            {
                int n;
                try
                {
                    n = db.Retiro.Max(p => p.id_Retiro);
                }
                catch (Exception e)
                {
                    n = 1000;
                }
                retiro.id_Retiro = n + 1;
                retiro.monto = cantidadRetirar;
            }
            insertarTransaccion(retiro);// inserta el retiro en el historial

            _saldo -= cantidadRetirar;
            _billetesDe20 -= (cantidadRetirar / 20);
            guardarCambios(); //actualizamos el archivo
            Console.WriteLine("Recoja su dinero...");
            Console.ReadKey();
        }

        private void depositarDinero()
        {
            int monto; //deposito
            int numeroDeCuentaDeposito;
            bool repetirUsuario = false;

            do
            {
                repetirUsuario = false;
                Console.Clear();
                Console.WriteLine("Introdusca el numero de cuenta al que le va a depositar o 0 para salir: ");
                numeroDeCuentaDeposito = Convert.ToInt32(Console.ReadLine());
                if (numeroDeCuentaDeposito == 0)
                {
                    return;
                }
                else if (!revisarExistenciaCliente(numeroDeCuentaDeposito))
                {
                    Console.WriteLine("No existe esa cuenta...");
                    Console.ReadLine();
                    repetirUsuario = true;
                }

            } while (repetirUsuario);

            Console.WriteLine("Introdusca el monto o 0 para salir: ");
            monto = int.Parse(Console.ReadLine());
            if (monto == 0)
            {
                return;
            }

            monto = monto / 100; //monto real

            for (int i = 0; i < 1200; i++) //2 min
            {
                Thread.Sleep(100);
                if (Console.KeyAvailable)
                {
                    //si se pulsa una tecla en menos de 2 min
                    if (numeroDeCuentaDeposito == _numeroDeUsuario)
                    {
                        _tempSaldo += monto;
                    }
                    else //se separa ya que si el usuario se deposita a el mismo no podra ver el cambio hasta salir de la sesion
                    {
                        depositarCliente(numeroDeCuentaDeposito, monto);
                    }

                    Deposito deposito = new Deposito(); //crea deposito para el historial
                    using (ATMEntities db = new ATMEntities())
                    {
                        int n;
                        try
                        {
                            n = db.Deposito.Max(p => p.id_Deposito);
                        }
                        catch (Exception e)
                        {
                            n = 1000;
                        }
                        deposito.id_Deposito = n + 1;
                        deposito.monto = monto;
                        deposito.N_Cuenta = numeroDeCuentaDeposito;
                    }
                    insertarTransaccion(deposito);// inserta el deposito en el historial

                    Console.WriteLine("Listo :) \n pulsa enter");
                    Console.ReadKey();
                    Console.ReadLine();
                    return;
                }

            }
            //ya pasaron 2 min

            Console.WriteLine("cancelado por inactividad...");
            Console.ReadKey();
        }

        private bool revisarExistenciaCliente(int n)
        {
            // regresa True si existe el cliente y False en caso contrario
            using (ATMEntities db = new ATMEntities())
            {
                Cliente cliente = db.Cliente.Where(d => d.N_Cuenta == n).FirstOrDefault();
                if(cliente != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        private void depositarCliente(int numCuenta, int monto)
        {
            /*
             * Le suma el monto al saldo del cliente con el Numero de cuenta igual al especificado (numCuenta)
             */
            using (ATMEntities db = new ATMEntities())
            {
                Cliente cliente = db.Cliente.Where(d => d.N_Cuenta == numCuenta).FirstOrDefault();
                
                cliente.Saldo = cliente.Saldo + monto;

                db.Entry(cliente).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

            }
        }

        /*
         * inserta transaccion crea el historial, añade un registro en la tabla transacciones y uno en consulta, retiro o deposito
         * dependiendo del caso
         */
        private void insertarTransaccion(Consulta consulta)
        {
            int tipo = 1;
            int n;
            using (ATMEntities db = new ATMEntities())
            {
                Transaccion transaccion = new Transaccion();
                transaccion.Fecha = DateTime.Today; // obtiene la fecha actual
                transaccion.Hora = DateTime.Now.TimeOfDay; // hora de la transaccion
                transaccion.Tipo = tipo;
                transaccion.N_Cuenta = _numeroDeUsuario;
                try
                {
                    n = db.Transaccion.Max(p => p.N_Folio);
                }
                catch (Exception e)
                {
                    n = 1000;
                }
                transaccion.N_Folio = n + 1;

                db.Transaccion.Add(transaccion);
                db.Entry(transaccion).State = System.Data.Entity.EntityState.Added;

                consulta.N_Folio = transaccion.N_Folio;

                db.Consulta.Add(consulta);
                db.Entry(consulta).State = System.Data.Entity.EntityState.Added;

                db.SaveChanges();
            }
        }

        private void insertarTransaccion(Retiro retiro)
        {
            int tipo = 2;
            int n;
            using (ATMEntities db = new ATMEntities())
            {
                Transaccion transaccion = new Transaccion();
                transaccion.Fecha = DateTime.Today;
                transaccion.Hora = DateTime.Now.TimeOfDay;
                transaccion.Tipo = tipo;
                transaccion.N_Cuenta = _numeroDeUsuario;
                try
                {
                    n = db.Transaccion.Max(p => p.N_Folio);
                }
                catch (Exception e)
                {
                    n = 1000;
                }
                transaccion.N_Folio = n + 1;

                db.Transaccion.Add(transaccion);
                db.Entry(transaccion).State = System.Data.Entity.EntityState.Added;

                retiro.N_Folio = transaccion.N_Folio;

                db.Retiro.Add(retiro);
                db.Entry(retiro).State = System.Data.Entity.EntityState.Added;

                db.SaveChanges();
            }
        }

        private void insertarTransaccion(Deposito deposito)
        {
            int tipo = 3;
            int n;
            using (ATMEntities db = new ATMEntities())
            {
                Transaccion transaccion = new Transaccion();
                transaccion.Fecha = DateTime.Today;
                transaccion.Hora = DateTime.Now.TimeOfDay;
                transaccion.Tipo = tipo;
                transaccion.N_Cuenta = _numeroDeUsuario;
                try
                {
                    n = db.Transaccion.Max(p => p.N_Folio);
                }
                catch (Exception e)
                {
                    n = 1000;
                }
                transaccion.N_Folio = n + 1;

                db.Transaccion.Add(transaccion);
                db.Entry(transaccion).State = System.Data.Entity.EntityState.Added;

                deposito.N_Folio = transaccion.N_Folio;

                db.Deposito.Add(deposito);
                db.Entry(deposito).State = System.Data.Entity.EntityState.Added;

                db.SaveChanges();
            }
        }

        private void historialCliente()
        {
            /*
             * Menu de historial
             */
            int opc;
            bool seguir = true;
            do
            {
                Console.Clear();
                Console.WriteLine("Seleccione una opcion: \n 1) Mes actual  \n 2) Seleccionar mes");
                opc = Convert.ToInt32(Console.ReadLine());
                switch (opc)
                {
                    case 1:
                        historialClienteMes(Convert.ToInt32(DateTime.Today.ToString("MM"))); //inserta el mes actual
                        seguir = false;
                        break;
                    case 2:
                        historialClienteMes(seleccionarMes()); //inserta mes seleccionado
                        seguir = false;
                        break;
                    default:
                        Console.WriteLine("Opcion invalida...");
                        Console.ReadLine();
                        seguir = true;
                        break;
                }
            } while (seguir);
        }

        private int seleccionarMes()
        {
            int mesActual = Convert.ToInt32(DateTime.Today.ToString("MM")); //mes actual
            String[] meses = { "Enero","Febrero","Marzo" ,"Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};
            int opcion = 0;
            bool seguir = true;

            do
            {
                Console.Clear();
                Console.WriteLine("INGRESA EL NUMERO DEL MES DEL QUE QUIERES VER ");
                for (int i = 0; i < mesActual; i++)
                {
                    Console.WriteLine(i+1 +") " + meses[i]); //imprime los meses hasta el actual
                }
                opcion = Convert.ToInt32(Console.ReadLine());
                if(opcion > mesActual || opcion <= 0) //SI LA OPCION ES MAYOR AL MES EN EL QUE ESTAMOS O ES UN MES QUE NO EXISTE
                {
                    Console.WriteLine("Opcion invalida...");
                    Console.ReadLine();
                    seguir = true;
                }
                else
                {
                    seguir = false;
                }
            } while (seguir);

            return opcion; //retorna el mes seleccionado
        }

        private void historialClienteMes(int mes)
        {
            /*
             * Imprime las transacciones
             */
            using (ATMEntities db = new ATMEntities())
            {
                var histTrans = db.Transaccion.Where(p => p.N_Cuenta == _numeroDeUsuario && p.Fecha.Value.Month == mes); // transacciones del usuario en el mes indicado

                Console.WriteLine($"Mes: {mes}");
                foreach(var x in histTrans)
                {
                    Console.WriteLine(textTransaccion(x)); // imprime la transaccion con los datos
                }
                Console.ReadLine();
            }
        }

        private String textTransaccion(Transaccion transaccion)
        {
            /*
             * crea el string que tiene los datos de la transaccion
             */
            StringBuilder builder = new StringBuilder();
            using (ATMEntities db = new ATMEntities())
            {
                var tiposT = db.Tipo_Transaccion;

                if (transaccion.Tipo == 1) //Consulta
                {
                    builder.Append(tiposT.ToArray()[0].Tipo); //se el agrega el nombre de la transaccion
                }
                else if (transaccion.Tipo == 2)
                {
                    builder.Append(tiposT.ToArray()[1].Tipo);//se el agrega el nombre de la transaccion
                    Retiro retiro = db.Retiro.Where(p => p.N_Folio == transaccion.N_Folio).FirstOrDefault(); //se obtiene el retiro

                    builder.Append($" Monto: {retiro.monto}"); //añadimos el monto

                } else if (transaccion.Tipo == 3)
                {
                    builder.Append(tiposT.ToArray()[2].Tipo);//se el agrega el nombre de la transaccion
                    Deposito deposito = db.Deposito.Where(p => p.N_Folio == transaccion.N_Folio).FirstOrDefault(); // se obtiene el deposito

                    builder.Append($" N de cuenta: {deposito.N_Cuenta}"); // añadimos la cuenta a la que se le deposito
                    builder.Append($" Monto: {deposito.monto}"); //añadimos el monto
                }
                builder.Append(" Fecha: " + transaccion.Fecha + " Hora: " + transaccion.Hora); // añadimos fecha y hora
            }
                return builder.ToString(); //regresamos la string
        }





        private void nRetiros(bool x)
        {
            int opc;
            bool seguir = true;
            do
            {
                Console.Clear();
                Console.WriteLine("Seleccione una opcion: \n 1) Mes actual  \n 2) Seleccionar mes");
                opc = Convert.ToInt32(Console.ReadLine());
                switch (opc)
                {
                    case 1:
                        if (x)
                        {
                            Console.WriteLine("Cantidad de retiros: " + cantidadRetiros(Convert.ToInt32(DateTime.Today.ToString("MM")))); //cantidad retiro
                        }
                        else
                        {
                            Console.WriteLine("Cantidad de $ retiros: " + cantidadDineroRetiros(Convert.ToInt32(DateTime.Today.ToString("MM")))); //dinero de retiros
                        }
                        seguir = false;
                        break;
                    case 2:
                        if (x)
                        {
                            Console.WriteLine("Cantidad de retiros: " + cantidadRetiros(seleccionarMes()));//cantidad retiro
                        }
                        else
                        {
                            Console.WriteLine("Cantidad de $ retiros: " + cantidadDineroRetiros(seleccionarMes()));//dinero de retiros
                        }
                        seguir = false;
                        break;
                    default:
                        Console.WriteLine("Opcion invalida...");
                        Console.ReadLine();
                        seguir = true;
                        break;
                }
            } while (seguir);
            Console.ReadLine();
        }

        private void nDepositos(bool x)
        {
            int opc;
            bool seguir = true;
            do
            {
                Console.Clear();
                Console.WriteLine("Seleccione una opcion: \n 1) Mes actual  \n 2) Seleccionar mes");
                opc = Convert.ToInt32(Console.ReadLine());
                switch (opc)
                {
                    case 1:
                        if (x)
                        {
                            Console.WriteLine("Cantidad de depositos: " + cantidadDepositos(Convert.ToInt32(DateTime.Today.ToString("MM"))));//cantidad de depositos
                        }
                        else
                        {
                            Console.WriteLine("Cantidad de $ depositos: " + cantidadDineroDepositos(Convert.ToInt32(DateTime.Today.ToString("MM"))));//dinero de depositos
                        }
                        seguir = false;
                        break;
                    case 2:
                        if (x)
                        {
                            Console.WriteLine("Cantidad de retiros: " + cantidadDepositos(seleccionarMes()));//cantidad de depositos
                        }
                        else
                        {
                            Console.WriteLine("Cantidad de $ retiros: " + cantidadDineroDepositos(seleccionarMes()));//dinero de depositos
                        }
                        seguir = false;
                        break;
                    default:
                        Console.WriteLine("Opcion invalida...");
                        Console.ReadLine();
                        seguir = true;
                        break;
                }
            } while (seguir);
            Console.ReadLine();
        }

        private int cantidadRetiros(int mes)
        {
            using (ATMEntities db = new ATMEntities())
            {
                var n = db.Transaccion.Count(p => p.Tipo == 2 && p.Fecha.Value.Month == mes ); //cantida de retiros del mes seleccionado
                return n;
            }
        }

        private int cantidadDepositos(int mes)
        {
            using (ATMEntities db = new ATMEntities())
            {
                var n = db.Transaccion.Count(p => p.Tipo == 3 && p.Fecha.Value.Month == mes );//cantida de depositos del mes seleccionado
                return n;
            }
        }

        private int cantidadDineroRetiros(int mes)
        {
            int dinero = 0;
            using (ATMEntities db = new ATMEntities())
            {
                var n = db.Transaccion.Where(p => p.Tipo == 2 && p.Fecha.Value.Month == mes && p.N_Cuenta == _numeroDeUsuario);

                foreach(var x in n)
                {
                    dinero += Convert.ToInt32(db.Retiro.Where(P => P.N_Folio == x.N_Folio).FirstOrDefault().monto); //cantida de dinero de retiros del mes seleccionado
                }
            }
            return dinero;
        }

        private int cantidadDineroDepositos(int mes)
        {
            int dinero = 0;
            using (ATMEntities db = new ATMEntities())
            {
                var n = db.Transaccion.Where(p => p.Tipo == 3 && p.Fecha.Value.Month == mes && p.N_Cuenta == _numeroDeUsuario);

                foreach (var x in n)
                {
                    dinero += Convert.ToInt32(db.Deposito.Where(P => P.N_Folio == x.N_Folio).FirstOrDefault().monto); //cantida de dinero de depositos del mes seleccionado
                }
            }
            return dinero;
        }

        private void gerenteRevisarCliente()
        {
            int n; // cuenta a revisar
            bool rep = true;
            do
            {
                Console.Clear();
                Console.WriteLine("Numero de cuenta a revisar: ");
                n = Convert.ToInt32(Console.ReadLine()); 

                rep = revisarExistenciaCliente(n); //revisar si existe
                if (!rep)
                {
                    Console.WriteLine("Usuario invalido...");
                    Console.ReadLine();
                }

            } while (!rep);

            int opc;
            bool seguir = true;
            do
            {
                Console.Clear();
                Console.WriteLine("Seleccione una opcion: \n 1) Mes actual  \n 2) Seleccionar mes");
                opc = Convert.ToInt32(Console.ReadLine());
                switch (opc)
                {
                    case 1:
                        historialClienteMes(Convert.ToInt32(DateTime.Today.ToString("MM")),n); 
                        seguir = false;
                        break;
                    case 2:
                        historialClienteMes(seleccionarMes(), n);
                        seguir = false;
                        break;
                    default:
                        Console.WriteLine("Opcion invalida...");
                        Console.ReadLine();
                        seguir = true;
                        break;
                }
            } while (seguir);
        }

        private void historialClienteMes(int mes, int n)
        {
            using (ATMEntities db = new ATMEntities())
            {
                var histTrans = db.Transaccion.Where(p => p.N_Cuenta == n && p.Fecha.Value.Month == mes);

                Console.WriteLine($"Mes: {mes}");
                foreach (var x in histTrans)
                {
                    Console.WriteLine(textTransaccion(x));
                }
                Console.ReadLine();
            }
        }
    }
}
