FROM oracle/graalvm-ce:19.3.1-java8 as graalvm
# For JDK 11
#FROM oracle/graalvm-ce:19.3.1-java11 as graalvm
RUN gu install native-image

COPY . /home/app/micronaut-servlet-graal
WORKDIR /home/app/micronaut-servlet-graal

RUN native-image --no-server -cp build/libs/micronaut-servlet-graal-*-all.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-servlet-graal/micronaut-servlet-graal /app/micronaut-servlet-graal
ENTRYPOINT ["/app/micronaut-servlet-graal"]
