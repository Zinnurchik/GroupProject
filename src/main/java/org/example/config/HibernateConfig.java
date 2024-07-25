package org.example.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Objects;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:app.properties")
public class HibernateConfig {
    private final Environment environment;

    public HibernateConfig(@Autowired Environment environment) {
        this.environment = environment;
    }

    @Bean
    public DataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource(Objects.requireNonNull(environment.getProperty("db.url")),
                Objects.requireNonNull(environment.getProperty("db.username")), Objects.requireNonNull(environment.getProperty("db.password")));
        dataSource.setDriverClassName(Objects.requireNonNull(environment.getProperty("db.driver")));
        return dataSource;
    }

    @Bean
    public LocalSessionFactoryBean sessionFactoryBean(@Autowired DataSource dataSource){
        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
        localSessionFactoryBean.setDataSource(dataSource);
        localSessionFactoryBean.setHibernateProperties(getProperties());
        localSessionFactoryBean.setPackagesToScan("org.example.model");
        return localSessionFactoryBean;
    }

    public Properties getProperties(){
        Properties properties = new Properties();
        properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
        properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
        properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
        properties.put("hibernate.hbm2ddl.auto", environment.getRequiredProperty("hibernate.hbm2ddl.auto"));
        return properties;
    }

    @Bean
    public HibernateTransactionManager transactionManager(LocalSessionFactoryBean localSessionFactoryBean){
        return new HibernateTransactionManager(Objects.requireNonNull(localSessionFactoryBean.getObject()));
    }
}
