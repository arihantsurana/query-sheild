FROM tiangolo/uvicorn-gunicorn:python3.6-alpine3.8 AS base_container

ENV QS_HOME=/usr/local/radagast
WORKDIR ${QS_HOME}

COPY querysheild ${QS_HOME}/query-sheild
COPY setup.py ${QS_HOME}/setup.py

FROM base_container AS testing_container
COPY tests ${QS_HOME}/tests
RUN python ./setup.py test

FROM base_container AS production_container
RUN python ./setup.py install
ENTRYPOINT ["querysheild"]
EXPOSE 5000
