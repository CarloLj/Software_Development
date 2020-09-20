using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;

namespace ATM
{
    class Encrypt
    {
        public String EncryptPass(string input)
        {
            //encripta input por el algoritmo md5
            using (MD5CryptoServiceProvider  md5 = new MD5CryptoServiceProvider())
            {
                byte[] b = System.Text.Encoding.UTF8.GetBytes(input);
                b = md5.ComputeHash(b);
                return byteToString(b);
            }
        }

        public String byteToString(byte[] input)
        {
            //transforma un arregglo de byte a string
            StringBuilder sb = new StringBuilder();
            foreach (byte x in input)
            {
                sb.Append(x.ToString("x2"));
            }
            return sb.ToString();
        }
      

    }
}
