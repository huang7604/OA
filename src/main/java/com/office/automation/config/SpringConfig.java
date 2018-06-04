package com.office.automation.config;
import java.beans.PropertyVetoException;
import java.io.IOException;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@ImportResource("classpath:spring.xml")
@ComponentScan(basePackages={"com.office.automation.util","com.office.automation.service",
		"com.office.automation.dao","com.office.automation.bean"})
public class SpringConfig {
	@Autowired
	Environment env;
	
	@Bean
	public ComboPooledDataSource dataSource(){
		ComboPooledDataSource dataSource=new ComboPooledDataSource();
		try {
			dataSource.setDriverClass("com.mysql.jdbc.Driver");
			dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/OA?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true");
			dataSource.setUser("root");
			dataSource.setPassword("20141369");
			dataSource.setAcquireIncrement(5);
			dataSource.setInitialPoolSize(10);
			dataSource.setMinPoolSize(10);
			dataSource.setMaxPoolSize(20);
			
		} catch (PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory(ComboPooledDataSource dataSource){
		SqlSessionFactoryBean sqlSessionFactory=new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource);
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver(); 
		try {
			sqlSessionFactory.setMapperLocations(resolver.getResources("classpath:mapper/*.xml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
	}
	
	@Bean
	public MapperScannerConfigurer mapperScannerConfigurer(){
		MapperScannerConfigurer mapperScannerConfigurer=new MapperScannerConfigurer();
		mapperScannerConfigurer.setBasePackage("com.office.automation.dao");
		mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
		return mapperScannerConfigurer;
	}
	
	@Bean
	public DataSourceTransactionManager transactionManager(ComboPooledDataSource dataSource){
		DataSourceTransactionManager manager=new DataSourceTransactionManager();
		manager.setDataSource(dataSource);
		return manager;
	}

}
