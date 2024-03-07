FROM alpine:latest
RUN apk add --no-cache bash \
    --update \
    python3 \
    py-pip \
  && pip install flywheel-sdk --break-system-packages \
  && rm -rf /var/cache/apk/*

ENV FLYWHEEL=/flywheel/v0
RUN mkdir -p ${FLYWHEEL}
COPY run.py ${FLYWHEEL}/run.py

ENTRYPOINT ["python3 run.py"]

# build docker image
# docker build --no-cache -t jaimebarran/gear-tutorial .

# push docker image
# docker push jaimebarran/gear-tutorial:0.0.1