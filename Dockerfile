FROM alpine/git as clone
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/anushakilari486/spring-petclinic.git
FROM maven:latest as build
WORKDIR /app
COPY --from=clone /app/spring-petclinic /app
WORKDIR /app
#RUN ./mvnw
RUN mvn install -DskipTests
CMD java -jar target/*.jar

