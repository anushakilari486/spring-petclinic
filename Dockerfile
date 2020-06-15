FROM alpine/git as clone
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/anushakilari486/spring-petclinic.git
FROM maven:latest as build
WORKDIR /app
COPY --from=clone /app/spring-petclinic /app
RUN mvn install -DskipTests
FROM openjdk:latest
WORKDIR /app
COPY --from=build /app/target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar /app
CMD ["java -jar spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]

