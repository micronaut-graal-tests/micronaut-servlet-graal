#!/bin/bash

./gradlew nativeImage
cp build/native-image/servlet-tomcat .
