FROM openjdk:8
EXPOSE 8089
ADD target/spring-boot-web.jar spring-boot-web.jar
ENTRYPOINT ["java",".jar", "/spring-boot-web.jar"]
