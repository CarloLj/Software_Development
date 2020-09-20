/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculadorapplet;

import java.awt.Button;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JApplet;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 * Esta clase se encarga de Usar JApplet para ser una calculadora basica para Java en entorno web usando Internet Explorer
 * Esta clase imprime una form sencilla con dos textfield para ingresar datos y un textfield para mostrarlos
 * Cada que resolvemos una operacion se nos pone el resultado tanto arriba y abajo para que funcione sin necesidad de vovler a copiar el texto
 * Esta clase implementa un Action Listener para los botones de suma multiplicacion division y resta
 */
public class main extends JApplet implements ActionListener
{
    Button b1,b2,b3,b4;
    TextField tf1,tf2,tf3;
    Label lb1,lb2,lb3;
    
    /**
     * Esta es la inicializacion de nuestro Applet
     */
    @Override
    public void init()
    {
        lb1 = new Label("Numero 1");
        lb1.setBounds(100,40,100,20);
        tf1 = new TextField();
        tf1.setBounds(210,40,100,20);
        
        
        lb2 = new Label("Numero 2");
        lb2.setBounds(100,80,100,20);
        tf2 = new TextField();
        tf2.setBounds(210,80,100,20);

        b1 = new Button("+");
        b1.setBounds(80,120,60,50);
        b2 = new Button("-");
        b2.setBounds(130,120,60,50);
        b3 = new Button("*");
        b3.setBounds(180,120,60,50);
        b4 = new Button("/");
        b4.setBounds(230,120,60,50);
         
        lb3 = new Label("Resultado");
        lb3.setBounds(100,180,100,20);
        tf3 = new TextField();
        tf3.setBounds(210,180,100,20);
        
        add(lb1);
        add(lb2);
        add(lb3);
        add(tf1);
        add(tf2);
        add(tf3);
        add(b1);
        add(b2);
        add(b3);
        add(b4);
        
        b1.addActionListener(this);
        b2.addActionListener(this);
        b3.addActionListener(this);
        b4.addActionListener(this);
           
        setLayout(null);
        
    }

    /**
     * Esto es en caso de que se presione un boton
     * @param ae La variable del evento que sera usada para identificar de quien provino el click
     */
    @Override
    public void actionPerformed(ActionEvent ae) {
        int a = Integer.parseInt(tf1.getText());
        int b = Integer.parseInt(tf2.getText());
        
        if(ae.getSource() == b1){
            int s = a+b;
            tf3.setText(String.valueOf(s));
            tf1.setText(tf3.getText());
            tf2.setText("");
        }
        if(ae.getSource() == b2){
            int s = a-b;
            tf3.setText(String.valueOf(s));
            tf1.setText(tf3.getText());
            tf2.setText("");
        }
        if(ae.getSource() == b3){
            int s = a*b;
            tf3.setText(String.valueOf(s));
            tf1.setText(tf3.getText());
            tf2.setText("");
        }
        if(ae.getSource() == b4){
            int s = a/b;
            tf3.setText(String.valueOf(s));
            tf1.setText(tf3.getText());
            tf2.setText("");
        }
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
/* 
<applet code="calculadorapplet.class" width="400" height="400"> 
</applet> 
*/  

