FROM python:3.6-slim AS base_container
ENV QS_HOME=/usr/local/qs
WORKDIR ${QS_HOME}

FROM base_container AS testing_container
COPY querysheild ${QS_HOME}/query-sheild
COPY setup.py ${QS_HOME}/setup.py
COPY tests ${QS_HOME}/tests
RUN python ${QS_HOME}/setup.py test

FROM base_container AS production_container
COPY querysheild ${QS_HOME}/query-sheild
COPY setup.py ${QS_HOME}/setup.py
RUN pip install .

EXPOSE 5000
ENTRYPOINT qs
