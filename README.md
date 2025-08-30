# microservice-base-image

FROM 533267238276.dkr.ecr.ap-south-1.amazonaws.com/microservice-base-image:v1.1

COPY target/fusion-ms.jar app.jar

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
