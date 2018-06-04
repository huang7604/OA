package com.office.automation.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.repository.Deployment;
import org.junit.Test;

public class ActivityTest {

	@Test  
	public void testCreateTableWithXml(){  
	    // 引擎配置  
	    ProcessEngineConfiguration pec = null;
		try {
			pec = ProcessEngineConfiguration
					.createProcessEngineConfigurationFromInputStream
					(new FileInputStream("G:/Java Project/OfficeAutomation/target/test-classes/Activity.cfg.xml"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    // 获取流程引擎对象  
	    ProcessEngine processEngine=pec.buildProcessEngine();
	    Deployment deployment=processEngine.getRepositoryService()
	    		              .createDeployment()
	    		              .name("出差流程")
	    		              .addClasspathResource("diagrams/OvertimeProcess.bpmn")
	    		              .addClasspathResource("diagrams/OvertimeProcess.png")
	    		              .deploy();
	    System.out.println("processEngine:"+processEngine);
	    System.out.println("deploymentID:"+deployment.getId());
	    //processEngine.getRepositoryService().deleteDeployment("20001 ",true);
	}  

	
}
