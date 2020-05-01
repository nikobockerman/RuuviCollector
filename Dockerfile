FROM maven:3.6-adoptopenjdk-8
RUN apt update
RUN apt install -y bluez bluez-hcidump
COPY pom.xml .
RUN mvn -B dependency:resolve-plugins dependency:resolve clean package
ADD . /app
WORKDIR /app
RUN mvn -B clean package
CMD ["java", "-jar", "target/ruuvi-collector-0.2.jar"]
