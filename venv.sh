#!/usr/bin/env bash
virtualenv venv && \
source venv/bin/activate && \
python ./setup.py test && \
python ./setup.py install && \
qs
