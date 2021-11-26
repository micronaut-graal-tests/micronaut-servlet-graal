#!/bin/bash

./gradlew nativeCompile
cp build/native/nativeCompile/servlet-jetty .
