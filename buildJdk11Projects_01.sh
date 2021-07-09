#!/bin/bash

set -e
set -o pipefail

mvn -B -f consumer-driven-contracts-with-spring-cloud-contract/book-store-server install

declare -a arr=("whats-new-in-spring-boot-2.1"
 "charts-in-pdf-java-ee"
 "avoid-repeating-attributes-in-jpa-entities"
 "java-benchmarking-with-jmh"
 "lazy-loading-of-jpa-attributes-with-hibernate"
 "graalvm-intro"
 "send-emails-with-sendgrid-and-spring-boot"
 "bootstrap-jakarta-ee-8-application"
 "custom-maven-archetype"
 "demo-crud-application"
 "dynamic-sql-querying-with-pagination"
 "deploy-spring-boot-to-gke"
 "spring-boot-hibernate-flyway-best-practices"
 "random-data-in-java-using-java-faker"
 "guide-to-jakarta-ee-with-react-and-postgresql"
 "five-java-9-features"
 "consumer-driven-contracts-with-spring-cloud-contract/book-store-client"
 "java-ee-with-kotlin"
 "spring-boot-with-kotlin"
 )

for project in "${arr[@]}"
do
  mvn -B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn -f $project/pom.xml verify
done