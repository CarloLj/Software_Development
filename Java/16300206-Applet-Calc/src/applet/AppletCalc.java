package applet;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JApplet;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JTextField;


public class AppletCalc extends JApplet
{
    
    public JTextField n1 = new JTextField(), 
                      n2 = new JTextField(),
                      res = new JTextField();
    public JButton cmdSuma = new JButton("Suma");
    
    
    public double suma(double a, double b)
    {
        return a + b;
    }   
    
    public void click()
    {
        double a = Double.parseDouble(n1.getText());
        double b = Double.parseDouble(n2.getText());
        double r;
        r = suma(a,b);
        res.setText("" + r);
    }
    
    public void init()
    {
        n1.setBounds(10, 10, 30, 30);
        n2.setBounds(10, 50, 30, 30);
        cmdSuma.setBounds(10, 90, 100, 30);
        res.setBounds(10, 130, 30, 30);        
        
        setLayout(null);
        
        add(n1);
        add(n2);
        add(res);
        add(cmdSuma);        
        
        cmdSuma.addActionListener((ActionEvent e) -> { click(); });
    }
}
/* 
<applet code="AppletCalc.class" width="300" height="300"> 
</applet> 
*/  
