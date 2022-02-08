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

