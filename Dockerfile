FROM openjdk:17-jdk-alpine

COPY target/demo-1.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
