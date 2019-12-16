/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processing;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import processing.Processor;

public class Schedule implements ServletContextListener{
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("ServletContextListener destroyed");
	}

        //Run this before web application is started
	@Override
	public void contextInitialized(ServletContextEvent arg0) 
        {
            
            Processor P = new Processor();
            TimerTask task; 
            task = new TimerTask() 
            {
                public void run()
                {
                     System.out.println("Bckground task executed "+new Date());
                     Processor P=new Processor();
                    try {
                           
                        P.doOperations();
                       
                       System.out.println("Process call done!");
                    } catch (Exception ex) {
                        System.out.println(ex);
                    }
                }
            };

            Timer timer = new Timer();
            long delay = 1000;
            System.out.println("in run");  

            long intevalPeriod =60 * 1 * 1000; //will suspend thread for 1 minutes
            timer.scheduleAtFixedRate(task, delay, intevalPeriod);
        
    }
}


