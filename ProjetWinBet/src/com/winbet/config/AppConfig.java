package com.winbet.config;

import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ImportResource("classpath:application-context.xml")
@ComponentScan(basePackages = { "com.winbet.dao", "com.winbet.services" })
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = { "com.winbet.dao" })
public class AppConfig {
    //
}
