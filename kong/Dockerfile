FROM alpine:3.20
RUN apk add --no-cache curl
WORKDIR /app
COPY init.sh .
COPY ./fe/lnk-fe-svc.json .
COPY ./be/lnk-be-svc.json .
COPY ./fe/all.json .
COPY ./be/be-user.json .
COPY ./be/be-guest.json .

RUN ls . && pwd && sleep 5

RUN pwd && sleep 2 &&chmod +x ./init.sh

CMD ["sh", "-c","pwd && sleep 2 && ./init.sh"]
