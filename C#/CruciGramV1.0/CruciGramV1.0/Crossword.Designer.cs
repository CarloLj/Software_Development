namespace CruciGramV1._0
{
    partial class Crossword
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Crossword));
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.labeldificultad = new System.Windows.Forms.Label();
            this.botonverificar = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.ControlDark;
            this.panel1.Font = new System.Drawing.Font("Ravie", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel1.Location = new System.Drawing.Point(13, 35);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(960, 664);
            this.panel1.TabIndex = 0;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.ControlDark;
            this.panel2.Location = new System.Drawing.Point(978, 35);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(305, 275);
            this.panel2.TabIndex = 1;
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.panel3.Location = new System.Drawing.Point(978, 345);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(305, 275);
            this.panel3.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.MenuText;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label1.Location = new System.Drawing.Point(1058, 3);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(147, 29);
            this.label1.TabIndex = 3;
            this.label1.Text = "Horizontales";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.SystemColors.MenuText;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label2.Location = new System.Drawing.Point(1073, 313);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(119, 29);
            this.label2.TabIndex = 4;
            this.label2.Text = "Verticales";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // labeldificultad
            // 
            this.labeldificultad.AutoSize = true;
            this.labeldificultad.BackColor = System.Drawing.SystemColors.ControlText;
            this.labeldificultad.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labeldificultad.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.labeldificultad.Location = new System.Drawing.Point(480, 3);
            this.labeldificultad.Name = "labeldificultad";
            this.labeldificultad.Size = new System.Drawing.Size(21, 29);
            this.labeldificultad.TabIndex = 5;
            this.labeldificultad.Text = "-";
            // 
            // botonverificar
            // 
            this.botonverificar.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.botonverificar.BackgroundImage = global::CruciGramV1._0.Properties.Resources.puzzle;
            this.botonverificar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.botonverificar.Location = new System.Drawing.Point(1007, 626);
            this.botonverificar.Name = "botonverificar";
            this.botonverificar.Size = new System.Drawing.Size(276, 72);
            this.botonverificar.TabIndex = 7;
            this.botonverificar.Text = "Verificar";
            this.botonverificar.UseVisualStyleBackColor = false;
            this.botonverificar.Click += new System.EventHandler(this.botonverificar_Click);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.button1.BackgroundImage = global::CruciGramV1._0.Properties.Resources.puzzle;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("Stencil", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(979, 626);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(293, 72);
            this.button1.TabIndex = 8;
            this.button1.Text = "Verificar";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Crossword
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1284, 711);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.botonverificar);
            this.Controls.Add(this.labeldificultad);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Crossword";
            this.Text = "Crossword";
            this.Load += new System.EventHandler(this.Crossword_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label labeldificultad;
        private System.Windows.Forms.Button botonverificar;
        private System.Windows.Forms.Button button1;


    }
}