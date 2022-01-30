FROM openjdk

WORKDIR /test

COPY shady.java /test

RUN javac shady.java

CMD java shady
