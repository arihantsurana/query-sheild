#!/usr/bin/env bash
docker build . -t query-sheild && \
docker run -p 5000:5000 query-sheild
