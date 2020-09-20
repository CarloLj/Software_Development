namespace CruciGramV1._0
{
    partial class CruciGram
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CruciGram));
            this.titulo = new System.Windows.Forms.Label();
            this.boton3 = new System.Windows.Forms.Button();
            this.boton2 = new System.Windows.Forms.Button();
            this.boton1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // titulo
            // 
            this.titulo.AutoSize = true;
            this.titulo.BackColor = System.Drawing.Color.Transparent;
            this.titulo.Font = new System.Drawing.Font("Bernard MT Condensed", 48F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.titulo.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.titulo.Location = new System.Drawing.Point(89, 120);
            this.titulo.Name = "titulo";
            this.titulo.Size = new System.Drawing.Size(630, 76);
            this.titulo.TabIndex = 3;
            this.titulo.Text = "Selecciona tu dificultad";
            // 
            // boton3
            // 
            this.boton3.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.boton3.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.boton3.Image = global::CruciGramV1._0.Properties.Resources.dificil1;
            this.boton3.Location = new System.Drawing.Point(547, 264);
            this.boton3.Name = "boton3";
            this.boton3.Size = new System.Drawing.Size(225, 217);
            this.boton3.TabIndex = 7;
            this.boton3.UseVisualStyleBackColor = true;
            this.boton3.Click += new System.EventHandler(this.boton3_Click);
            this.boton3.MouseEnter += new System.EventHandler(this.boton3_MouseEnter);
            this.boton3.MouseLeave += new System.EventHandler(this.boton3_MouseLeave);
            // 
            // boton2
            // 
            this.boton2.FlatAppearance.BorderSize = 5;
            this.boton2.Font = new System.Drawing.Font("Microsoft Sans Serif", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.boton2.Image = global::CruciGramV1._0.Properties.Resources.Medio;
            this.boton2.Location = new System.Drawing.Point(282, 264);
            this.boton2.Name = "boton2";
            this.boton2.Size = new System.Drawing.Size(233, 217);
            this.boton2.TabIndex = 1;
            this.boton2.UseVisualStyleBackColor = true;
            this.boton2.Click += new System.EventHandler(this.boton2_Click);
            this.boton2.MouseEnter += new System.EventHandler(this.boton2_MouseEnter);
            this.boton2.MouseLeave += new System.EventHandler(this.boton2_MouseLeave);
            // 
            // boton1
            // 
            this.boton1.FlatAppearance.BorderSize = 5;
            this.boton1.Font = new System.Drawing.Font("Microsoft Sans Serif", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.boton1.Image = global::CruciGramV1._0.Properties.Resources.facil1;
            this.boton1.Location = new System.Drawing.Point(12, 264);
            this.boton1.Name = "boton1";
            this.boton1.Size = new System.Drawing.Size(237, 217);
            this.boton1.TabIndex = 0;
            this.boton1.UseVisualStyleBackColor = true;
            this.boton1.Click += new System.EventHandler(this.boton1_Click);
            this.boton1.MouseEnter += new System.EventHandler(this.boton1_MouseEnter);
            this.boton1.MouseLeave += new System.EventHandler(this.boton1_MouseLeave);
            // 
            // CruciGram
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.BackgroundImage = global::CruciGramV1._0.Properties.Resources.puzzle;
            this.ClientSize = new System.Drawing.Size(784, 661);
            this.Controls.Add(this.boton3);
            this.Controls.Add(this.titulo);
            this.Controls.Add(this.boton2);
            this.Controls.Add(this.boton1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "CruciGram";
            this.Text = "CruciGram";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button boton1;
        private System.Windows.Forms.Button boton2;
        private System.Windows.Forms.Label titulo;
        private System.Windows.Forms.Button boton3;
    }
}

