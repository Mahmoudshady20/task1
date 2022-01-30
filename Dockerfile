FROM openjdk

WORKDIR /test

COPY shady.java.java /test

RUN javac shady.java.java

CMD java shady
