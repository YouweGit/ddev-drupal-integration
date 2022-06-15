#!/usr/bin/env bash
set -e

# Ensure "dev" core config is always up to date even after the
# core has been created. This does not execute the first time,
# when solr-precreate has not yet run.
declare -a CORENAMES=('dev')
# To make 2 cores:
# declare -a CORENAME=('core1' 'core2')
for CORENAME in "${CORENAMES[@]}"
do
  if [ -d /opt/solr/server/solr/mycores/${CORENAME}/conf ]; then
      # Replace existing conf dir entirely to ensure deleted config files are removed.
      rm -r /opt/solr/server/solr/mycores/${CORENAME}/conf
      cp -r /solr-${CORENAME}-conf/conf /opt/solr/server/solr/mycores/${CORENAME}/conf
  fi
done
