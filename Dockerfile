FROM alpine:3.10

RUN apk --update add privoxy tor runit tini
COPY service /etc/service/

RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup && \
    chown -R appuser:appgroup ./etc/service/

USER appuser

EXPOSE 8118 9050
ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
