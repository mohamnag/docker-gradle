FROM java:8
MAINTAINER Mohammad Naghavi <mohamnag@gmail.com>

ENV GRADLE_VERSION 2.8


ADD https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip /usr/bin/gradle.zip
WORKDIR /usr/bin
RUN apt-get install -y unzip && \
    unzip gradle.zip && \
    ln -s gradle-${GRADLE_VERSION} gradle && \
    rm gradle.zip

# clean up
RUN apt-get remove -y unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*    

ENV GRADLE_USER_HOME /usr/bin/gradle
ENV PATH $PATH:$GRADLE_USER_HOME/bin

# Default command is "/usr/bin/gradle -version" on /app dir
# (ie. Mount project at /app "docker --rm -v /path/to/app:/app gradle <command>")
RUN mkdir /app
WORKDIR /app
CMD ["gradle", "-version"]
