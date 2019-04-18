FROM openjdk:8-jdk-slim
WORKDIR /home/demo1
ARG REVISION
COPY target/demo1-${REVISION}.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
