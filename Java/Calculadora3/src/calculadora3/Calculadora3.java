package calculadora3;

import javax.swing.*;
import java.awt.event.*;


public class Calculadora3 extends JFrame implements ActionListener{
    
    
    private JButton boton1;
    private JButton boton2;
    private JButton boton3;
    private JButton boton4;
    public JButton boton5;
    public JButton boton6;
    public JButton boton7;
    public JButton boton8;
    public JButton boton9;
    public JButton boton0;
    public JButton botonSuma;
    public JButton botonResta;
    public JButton botonDivision;
    public JButton botonMultiplicacion;
    public JButton botonIgual;
    public JButton botonCE;
    public JButton botonCerrar;
    public JTextField campoDeTexto;
    public String  memoria1;
    public String  memoria2;
    public String signo;
    
    public Calculadora3(){
        
        setLayout(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        
        campoDeTexto = new JTextField();
        campoDeTexto.setBounds(50, 25, 300, 30);
        add(campoDeTexto);
        
        boton1 = new JButton("1");
        boton1.setBounds(50, 75, 50, 50);
        add(boton1);
        
        boton2 = new JButton("2");
        boton2.setBounds(115, 75, 50, 50);
        add(boton2);
        
        boton3 = new JButton("3");
        boton3.setBounds(180, 75, 50, 50);
        add(boton3);
        
        boton4 = new JButton("4");
        boton4.setBounds(50, 150, 50, 50);
        add(boton4);
        
        boton5 = new JButton("5");
        boton5.setBounds(115, 150, 50, 50);
        add(boton5);
        
        boton6 = new JButton("6");
        boton6.setBounds(180, 150, 50, 50);
        add(boton6);
        
        boton7 = new JButton("7");
        boton7.setBounds(50, 225, 50, 50);
        add(boton7);
        
        boton8 = new JButton("8");
        boton8.setBounds(115, 225, 50, 50);
        add(boton8);
        
        boton9 = new JButton("9");
        boton9.setBounds(180, 225, 50, 50);
        add(boton9);
        
        boton0 = new JButton("0");
        boton0.setBounds(50, 300, 180, 50);
        add(boton0);
        
        botonSuma = new JButton("+");
        botonSuma.setBounds(245, 75, 50, 50);
        add(botonSuma);
        
        botonResta = new JButton("-");
        botonResta.setBounds(305, 75, 50, 50);
        add(botonResta);
        
        botonDivision = new JButton("÷");
        botonDivision.setBounds(245, 150, 50, 50);
        add(botonDivision);
        
        botonMultiplicacion = new JButton("x");
        botonMultiplicacion.setBounds(305, 150, 50, 50);
        add(botonMultiplicacion);
        
        botonIgual = new JButton("=");
        botonIgual.setBounds(245, 225, 50, 125);
        add(botonIgual);
        
        botonCE = new JButton("CE");
        botonCE.setBounds(305, 225, 50, 125);
        add(botonCE);
        
        botonCerrar = new JButton("cerrar");
        botonCerrar.setBounds(500, 75, 45, 45);
        add(botonCerrar);
        
        
        boton1.addActionListener(this); 
        boton2.addActionListener(this);
        boton3.addActionListener(this);
        boton4.addActionListener(this);
        boton5.addActionListener(this);
        boton6.addActionListener(this);
        boton7.addActionListener(this);
        boton8.addActionListener(this);
        boton9.addActionListener(this);
        boton0.addActionListener(this);
        botonSuma.addActionListener(this);
        botonResta.addActionListener(this);
        botonDivision.addActionListener(this);
        botonMultiplicacion.addActionListener(this);
        botonCerrar.addActionListener(this); 
        botonCE.addActionListener(this);
        botonIgual.addActionListener(this);
    
    }
    public void actionPerformed(ActionEvent accion){
            if(accion.getSource() == botonCerrar){
                System.exit(0);
            }
            if(accion.getSource() == getBoton1()){
                campoDeTexto.setText(campoDeTexto.getText()+"1");
            }
            if(accion.getSource() == getBoton2()){
                campoDeTexto.setText(campoDeTexto.getText()+"2");
            }
            if(accion.getSource() == getBoton3()){
                campoDeTexto.setText(campoDeTexto.getText()+"3");
            }
            if(accion.getSource() == getBoton4()){
                campoDeTexto.setText(campoDeTexto.getText()+"4");
            }
            if(accion.getSource() == boton5){
                campoDeTexto.setText(campoDeTexto.getText()+"5");
            }
            if(accion.getSource() == boton6){
                campoDeTexto.setText(campoDeTexto.getText()+"6");
            }
            if(accion.getSource() == boton7){
                campoDeTexto.setText(campoDeTexto.getText()+"7");
            }
            if(accion.getSource() == boton8){
                campoDeTexto.setText(campoDeTexto.getText()+"8");
            }
            if(accion.getSource() == boton9){
                campoDeTexto.setText(campoDeTexto.getText()+"9");
            }
            if(accion.getSource() == boton0){
                campoDeTexto.setText(campoDeTexto.getText()+"0");
            }
            if(accion.getSource()== botonCE){
                campoDeTexto.setText("");
            }
            if(accion.getSource() == botonSuma){
                if(!campoDeTexto.getText().equals("")){
                    signo = "+";
                    memoria1 = campoDeTexto.getText();
                    campoDeTexto.setText("");
                    //campoDeTexto.setText("memoria1");
                    
                }
            }
            if(accion.getSource()== botonResta){
                if(!campoDeTexto.getText().equals("")){
                    signo = "-";
                    memoria1 = campoDeTexto.getText();
                    campoDeTexto.setText("");
                   // campoDeTexto.setText("hola");
                  
                }
            }if(accion.getSource()== botonDivision){
                if(!campoDeTexto.getText().equals("")){
                    signo = "/";
                    memoria1 = campoDeTexto.getText();
                    campoDeTexto.setText("");
                   //campoDeTexto.setText("hola");
            }
            }
            if(accion.getSource()== botonMultiplicacion){
                if(!campoDeTexto.getText().equals("")){
                    signo = "*";
                    memoria1 = campoDeTexto.getText();
                    campoDeTexto.setText("");
                    //campoDeTexto.setText("hola");
                    
                   
                 
                }
            }
            if(accion.getSource()== botonIgual)
            {
                
                memoria2 = campoDeTexto.getText();
                if(!memoria2.equals(""))
                {
                   calculadora(memoria1, memoria2, signo);
                }
            }
        }    
    
    
    public void calculadora(String memoria1, String memoria2, String signo)
    {
        double resultado = 0.0;
        String respuesta;
        
        if(signo.equals("+")){
            resultado=Double.parseDouble(memoria1)+Double.parseDouble(memoria2);
        }
        if(signo.equals("-")){
            resultado=Double.parseDouble(memoria1)-Double.parseDouble(memoria2);
        }
        if(signo.equals("/")){
            resultado=Double.parseDouble(memoria1)/Double.parseDouble(memoria2);
        }
        if(signo.equals("*")){
            resultado=Double.parseDouble(memoria1)*Double.parseDouble(memoria2);
        }
        
        respuesta = Double.toString(resultado);
        campoDeTexto.setText(respuesta);
        
    }
    
    public static void main(String args[]){
        
        Calculadora3 _Calculadora3 = new Calculadora3();
        _Calculadora3.setBounds(200, 200, 425, 425);
        _Calculadora3.setVisible(true);
    }

    /**
     * @return the boton1
     */
    public JButton getBoton1() {
        return boton1;
    }

    /**
     * @param boton1 the boton1 to set
     */
    public void setBoton1(JButton boton1) {
        this.boton1 = boton1;
    }

    /**
     * @return the boton2
     */
    public JButton getBoton2() {
        return boton2;
    }

    /**
     * @param boton2 the boton2 to set
     */
    public void setBoton2(JButton boton2) {
        this.boton2 = boton2;
    }

    /**
     * @return the boton3
     */
    public JButton getBoton3() {
        return boton3;
    }

    /**
     * @param boton3 the boton3 to set
     */
    public void setBoton3(JButton boton3) {
        this.boton3 = boton3;
    }

    /**
     * @return the boton4
     */
    public JButton getBoton4() {
        return boton4;
    }

    /**
     * @param boton4 the boton4 to set
     */
    public void setBoton4(JButton boton4) {
        this.boton4 = boton4;
    }
}
    