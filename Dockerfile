FROM python:3-alpine

ARG VERSION=v3
VOLUME /var/lib/radicale
EXPOSE 5232
CMD ["radicale", "--hosts", "0.0.0.0:5232"]

RUN apk add --no-cache ca-certificates openssl \
 && apk add --no-cache --virtual .build-deps gcc libffi-dev musl-dev \
 && pip install --no-cache-dir "Radicale[bcrypt] @ https://github.com/Kozea/Radicale/archive/${VERSION}.tar.gz" \
 && apk del .build-deps