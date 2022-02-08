FROM openjdk:8u201-jre-alpine3.9
WORKDIR /debmedia
#RUN readlink -f $(which sh)

#ENV GITHUB_OAUTH_TOKEN="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"
#ENV TAGVERSION='${{steps.vars.outputs.tag}}'
RUN apk --no-cache update \
    && apk add --no-cache bash \ 
    && apk add --no-cache wget \
    && apk add gzip

#RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=156pEqCwcSdFkQ4Y0JZeObMniKbpKUHZJ' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=156pEqCwcSdFkQ4Y0JZeObMniKbpKUHZJ" -O Scripts_Ubuntu.zip && rm -rf /tmp/cookies.txt

#RUN wget https://github.com/gruntwork-io/fetch/releases/download/v0.4.2/fetch_linux_amd64\
   # && chmod +x ./fetch_linux_amd64

#RUN  ./fetch_linux_amd64 --github-oauth-token="$GITHUB_OAUTH_TOKEN"  --repo="https://github.com/debmedia/debQ/" --tag="$RELEASE_VERSION" --release-asset="stage.zip" ./

RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1156pEqCwcSdFkQ4Y0JZeObMniKbpKUHZJ' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=156pEqCwcSdFkQ4Y0JZeObMniKbpKUHZJ" -O Scripts_Ubuntu.zip && rm -rf /tmp/cookies.txt
COPY ./stage.zip /debmedia/stage.zip
RUN unzip /debmedia/stage.zip
RUN unzip /debmedia/Scripts_Ubuntu.zip
RUN mv  /debmedia/stage debQ
RUN find . -maxdepth 1 -not -name 'debQ.sh' -name '*.sh' -delete
RUN sed -i 's/#include "mySQL.conf"/include "mySQL.conf"/' /debmedia/debQ/conf/application.conf
RUN sed -i 's/include "SQLserver.conf"/#include "SQLserver.conf"/' /debmedia/debQ/conf/application.conf
RUN sed -i 's/localhost/db/g' /debmedia/debQ/conf/mySQL.conf
RUN sed -i 's/db.mysql.user="root"/db.mysql.user="user"/' /debmedia/debQ/conf/mySQL.conf
RUN rm *.zip
expose 9000
