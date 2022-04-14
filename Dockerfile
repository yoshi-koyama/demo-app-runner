FROM openjdk:11 as builder
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp
RUN ./gradlew build

FROM openjdk:11
WORKDIR /usr/src/myapp
COPY --from=builder /usr/src/myapp/build/libs/*.jar /usr/src/myapp/demo.jar
RUN ls
CMD ["ls -lrt"]
