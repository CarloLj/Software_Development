using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CruciGramV1._0
{
    public partial class CruciGram : Form
    {
        public CruciGram()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void boton1_Click(object sender, EventArgs e)
        {
            Crossword facil = new Crossword(1);
            //boton1.Enabled = false;
            facil.ShowDialog();
        }

        private void boton2_Click(object sender, EventArgs e)
        {
            //boton2.Enabled = false;
            Crossword medio = new Crossword(2);
            medio.ShowDialog();
        }

        private void boton3_Click(object sender, EventArgs e)
        {
            //boton3.Enabled = false;
            Crossword dificil = new Crossword(3);
            dificil.ShowDialog();
        }

        private void boton3_MouseEnter(object sender, EventArgs e)
        {
            this.boton3.Image = null;
            boton3.Font = new Font("Tahoma", 26, FontStyle.Bold);
            boton3.ForeColor = Color.Black;
            boton3.Text = "Dificil";
        }

        private void boton3_MouseLeave(object sender, EventArgs e)
        {
            this.boton3.Image = global::CruciGramV1._0.Properties.Resources.dificil1;
            boton3.Text = null;
        }

        private void boton2_MouseEnter(object sender, EventArgs e)
        {
            this.boton2.Image = null;
            boton2.Font = new Font("Tahoma", 26, FontStyle.Bold);
            boton2.ForeColor = Color.Black;
            boton2.Text = "Medio";
        }

        private void boton2_MouseLeave(object sender, EventArgs e)
        {
            this.boton2.Image = global::CruciGramV1._0.Properties.Resources.Medio;
            boton2.Text = null;
        }

        private void boton1_MouseEnter(object sender, EventArgs e)
        {
            this.boton1.Image = null;
            boton1.Font = new Font("Tahoma", 26, FontStyle.Bold);
            boton1.ForeColor = Color.Black;
            boton1.Text = "Facil";
        }

        private void boton1_MouseLeave(object sender, EventArgs e)
        {
            this.boton1.Image = global::CruciGramV1._0.Properties.Resources.facil1;
            boton1.Text = null;
        }

    }
}
