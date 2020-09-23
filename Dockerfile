FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8080/tcp
EXPOSE 8080/udp
ENTRYPOINT ["java","-jar","/app.jar","-Dserver.port","$PORT $JAR_OPTS"]