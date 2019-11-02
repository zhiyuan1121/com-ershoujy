package com.ershoujy.shiro;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Shiro配置类
 */
@Configuration
public class ShiroConfig {
    /**
     * 创建ShiroFilterFactoryBean
     */
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("sercurityManager") DefaultWebSecurityManager defaultWebSecurityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(defaultWebSecurityManager);
        Map<String,String> filterMap = new LinkedHashMap<String,String>();
        /**
         * anon:无需登录就能访问
         * authc:必须登录才可以访问
         * user:如果使用rememberMe的功能可以直接访问
         * perms:该资源必须得到资源权限才可以访问
         * role:该资源必须得到角色权限才可以访问
         */
        filterMap.put("/authc/**","authc");
//        filterMap.put("/authc/spxj/*","authc");
//        filterMap.put("/authc/spsj/*","authc");
        filterMap.put("/ym/authc/*","authc");
        filterMap.put("/ym/anon/*","anon");
        filterMap.put("/anon/*","anon");
        filterMap.put("/authc/jrgwc/*","anon");
//        filterMap.put("/authc/gmsp/*","authc");
        shiroFilterFactoryBean.setLoginUrl("/ym/anon/login");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterMap);
        return shiroFilterFactoryBean;

    }
    /**
     * 创建DefaulWebSecirityManager
     */
    @Bean(name = "sercurityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm){
        DefaultWebSecurityManager sercurityManager = new DefaultWebSecurityManager();
        sercurityManager.setRealm(userRealm);
        return sercurityManager;
    }
    /**
     * 创建Realm
     */
    @Bean(name="userRealm")
    public  UserRealm getRealm(){
        return new UserRealm();
    }
}
