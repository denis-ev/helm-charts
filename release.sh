#!/usr/bin/env bash

helm package charts/* -d releases
helm repo index --url https://evers.sh/helm-charts .