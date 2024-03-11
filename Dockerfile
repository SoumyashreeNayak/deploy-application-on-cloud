FROM openjdk:8
EXPOSE 8084
ADD target/Vaccination-Center-0.0.1-SNAPSHOT.war Vaccination-Center-0.0.1-SNAPSHOT.war
ENTRYPOINT [ "java","-jar","Vaccination-Center-0.0.1-SNAPSHOT.war" ]
