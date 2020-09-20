using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BuscaImagenes
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void textBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                if (textBox1.Text == "")
                {
                    MessageBox.Show("Ingrese un dato");
                }
                else
                {
                    try
                    {
                        comboBox1.Items.Add(textBox1.Text);
                        listBox1.Items.Add(textBox1.Text);
                        pictureBox1.Image = Image.FromFile(@"C:\Users\carlo\OneDrive\Imágenes\" + textBox1.Text + ".png");
                    }
                    catch (SystemException)
                    {
                        MessageBox.Show("No se pudo encontrar la imagen");
                    }
                }
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url;
            try
            {
                url = listBox1.Text;
                pictureBox1.Image = Image.FromFile(@"C:\Users\carlo\OneDrive\Imágenes\" + url + ".png");
            }
            catch (SystemException)
            {
                MessageBox.Show("Esta imagen no existe");
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url;
            try
            {
                url = comboBox1.Text;
                pictureBox1.Image = Image.FromFile(@"C:\Users\carlo\OneDrive\Imágenes\" + url + ".png");
            }
            catch (SystemException)
            {
                MessageBox.Show("Esta imagen no existe");
            }
        }
    }
}
