#!/bin/bash

#
# The following standard Expeditor artifact_actions environment variables
# are automatically set by the calling process:
#
# PROMOTABLE - in promotion artifact actions this is a reference to the
#              source channel.
# TARGET_CHANNEL - the channel which we are promoting to
# HAB_AUTH_TOKEN - GitHub Auth token used to communicate with the
#                  Habitat depot and private repos in Chef's GitHub org
#
set -eou pipefail

# printenv | grep EXPEDITOR

# Export the HAB_AUTH_TOKEN for use of promoting habitat packages to {{EXPEDITOR_TARGET_CHANNEL}}
HAB_AUTH_TOKEN=$(vault kv get -field auth_token account/static/habitat/chef-ci)
export HAB_AUTH_TOKEN

# # Export the HAB_AUTH_TOKEN for use of promoting habitat packages to {{TARGET_CHANNEL}}
# HAB_AUTH_TOKEN=$(vault kv get -field auth_token account/static/habitat/chef-ci)
# export HAB_AUTH_TOKEN
# when this workflow runs, there are env vars that are available to us in the running pod, we are grabbing the source ENV, then assigning it to our next channel
if [[ "${EXPEDITOR_CHANNEL}" == "unstable" ]]; then
  echo "This file does not support actions for artifacts promoted to unstable"
  exit 1
elif [[ "${EXPEDITOR_CHANNEL}" == "stable" ]]; then
  export EXPEDITOR_TARGET_CHANNEL="LTS-2024"
else
  echo "Unknown EXPEDITOR_CHANNEL: ${EXPEDITOR_CHANNEL}"
  exit 1
fi

# Promote the artifacts in Habitat Depot
if [[ "${EXPEDITOR_PKG_ORIGIN}" == "core" ]]; then
  echo "Skipping promotion of core origin package ${EXPEDITOR_PKG_ORIGIN}"
else
  echo "Promoting ${EXPEDITOR_PKG_IDENT} to the ${EXPEDITOR_TARGET_CHANNEL} channel"
  hab pkg promote "${EXPEDITOR_PKG_IDENT}" "${EXPEDITOR_TARGET_CHANNEL}"
fi