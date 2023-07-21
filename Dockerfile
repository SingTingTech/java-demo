FROM maven:3-eclipse-temurin-17 as builder
WORKDIR /app
ADD . /app
RUN --mount=type=cache,target=/root/.m2 mvn -T4 -DskipTests=true clean package


FROM azul/zulu-openjdk-alpine:17-jre-headless
COPY --from=builder /app/target/java-demo-0.0.1-SNAPSHOT.jar /app.jar

CMD ["java","-jar","/app.jar"]