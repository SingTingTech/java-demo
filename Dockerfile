FROM eclipse-temurin-17 as builder
WORKDIR /app
ADD . /app
RUN --mount=type=cache,target=/root/.m2 mvn -T4 -DskipTests=true clean package


FROM azul/zulu-openjdk-alpine:17-jre-headless
COPY --from=builder /app/target/java-demo*.jar /app.jar

CMD ["java","-jar","/app.jar"]