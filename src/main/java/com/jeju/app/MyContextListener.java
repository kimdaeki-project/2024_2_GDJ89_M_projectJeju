package com.jeju.app;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.jeju.app.apis.ApisService;

/**
 * Application Lifecycle Listener implementation class MyContextListener
 *
 */
public class MyContextListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
	@Autowired
	private ApisService apisService;
	
    public MyContextListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    @Override
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }
	
}
