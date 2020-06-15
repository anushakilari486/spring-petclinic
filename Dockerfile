FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/anushakilari486/petclinic.git
FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/petclinic /app
RUN mvn install
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/petclinic-1.0.1.jar /app
CMD ["java -jar petclinic-1.0.1.jar"]
