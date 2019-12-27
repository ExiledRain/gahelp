package io.khasang.gahelp.config;

import io.khasang.gahelp.dao.*;
import io.khasang.gahelp.dao.impl.*;
import io.khasang.gahelp.entity.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy
public class AppConfig {

    @Bean
    public HorseDao horseDao() {
        return new HorseDaoImpl(Horse.class);
    }

    @Bean
    public UserDao userDao() {
        return new UserDaoImpl(User.class);
    }

    @Bean
    public PhysicalSkillDao physicalSkillDao() {
        return new PhysicalSkillDaoImpl(PhysicalSkill.class);
    }

    @Bean
    public CharactersDao charactersDao() {
        return new CharactersDaoImpl(Characters.class);
    }

    @Bean
    public LogSheetDao logSheetDao() {
        return new LogSheetDaoImpl(LogSheet.class);
    }

    @Bean
    public MonsterDao monsterDao() {
        return new MonsterDaoImpl(Monster.class);
    }

    @Bean
    public EmployeeDao employeeDao() {
        return new EmployeeDaoImpl(Employee.class);
    }
}
