#!/bin/bash
VERSION="${PARAM_TARGET_VERSION:-${CIRCLE_SHA1:0:7}}"
args=()
if [ -n "$PARAM_COMPONENT_NAME" ]; then
  args+=(--component-name="$PARAM_COMPONENT_NAME")
fi
if [ -n "$PARAM_ENVIRONMENT_NAME" ]; then
  args+=(--environment-name="$PARAM_ENVIRONMENT_NAME")
fi
if [ -n "$PARAM_NAMESPACE" ]; then
  args+=(--namespace="$PARAM_NAMESPACE")
fi
circleci run release plan "$PARAM_DEPLOY_NAME" \
  "${args[@]}" \
  --target-version="$VERSION"
