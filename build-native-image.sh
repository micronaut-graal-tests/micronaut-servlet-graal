./gradlew assemble
native-image --no-server --static --no-fallback --class-path build/libs/micronaut-servlet-graal-*-all.jar