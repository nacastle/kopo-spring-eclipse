package di.java;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@ComponentScan(basePackages = {"di.java"})
@Configuration
public class Config {
	
	
	
//	@Bean
//	public Car car() {
//		return new Car();
//	}
	
//
//	@Bean
//	public Tire hankookTire() {
//		return new HankookTire();  // 컨테이너에 올라가서 메인함수 실행시켜주면 new로 올라감
//	}
//
//	@Bean(name = "kumho")
//	public Tire kumhoTire() {
//		return new KumhoTire();  // 컨테이너에 올라가서 메인함수 실행시켜주면 new로 올라감
//	}
	
//	@Configuration, @Bean, new AnnotationConfigApplicationContext(메인함수에서)는 밑 2개 라인을 xml에 추가해주는것과 같은 기능
//	<bean class="di.java.HankookTire" id="hankook"></bean>
//	<bean class="di.java.KumhoTire" id="kumho"></bean>

	
}
