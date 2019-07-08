FROM tiangolo/uvicorn-gunicorn:python3.6-alpine3.8 AS base_container

ENV QS_HOME=/usr/local/radagast
WORKDIR ${QS_HOME}

COPY query-sheild ${QS_HOME}/query-sheild
COPY setup.py ${QS_HOME}/setup.py

FROM base_container AS testing_container

# Copy in testing

COPY tests/requirements.txt ${QS_HOME}/tests/requirements.txt
RUN  pip install -r ${QS_HOME}/tests/requirements.txt
COPY tests ${QS_HOME}/tests
RUN py.test -v --cov=.  --cov-config .coveragerc

FROM base_container AS production_container
RUN pip install -e .
COPY run.sh ${QS_HOME}/run.sh
ENTRYPOINT ["run.sh"]
EXPOSE 5000
