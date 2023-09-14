# First stage: builder
FROM maven:3.6-openjdk-11

WORKDIR /java-image-optimizer/in 
# COPY imgs .

WORKDIR /java-image-optimizer/out

# Set work directory
WORKDIR /java-image-optimizer

# Copy the project files
COPY src/ ./src/
COPY pom.xml README.md entrypoint.sh /java-image-optimizer/

# Run Maven package
RUN mvn package

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
# ENTRYPOINT ["/bin/bash"]

CMD ["./in", "./out"]