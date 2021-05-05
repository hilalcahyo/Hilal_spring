package com.ogya.hilal.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.*;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
    private DataSource dataSource;
     
    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().passwordEncoder(passwordEncoder())
            .dataSource(dataSource)
            .usersByUsernameQuery("select email, password, 'true' as enabled from users where email=?")
            .authoritiesByUsernameQuery("select u.email, r.role from users u inner join user_role ur on (u.userid = ur.userid) inner join role r on (ur.roleid=r.roleid) where u.email=?")
        ;
    }
 
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
	        .antMatchers("/").permitAll()
	        .antMatchers("/login").permitAll()
	        .antMatchers("/signup").permitAll()
	        .antMatchers("/**").hasAuthority("SUPERUSER")
	        .anyRequest().authenticated()
            .and()
            .formLogin().loginPage("/login").failureUrl("/login?error=true")
            .defaultSuccessUrl("/home")
            .usernameParameter("email")
            .passwordParameter("password")
            .and().logout().permitAll()
            .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            .logoutSuccessUrl("/")
            .and().rememberMe()
            .and().exceptionHandling().accessDeniedPage("/access_denied");    
    }
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
