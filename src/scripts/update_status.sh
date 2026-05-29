#!/bin/bash
args=()
if [ -n "$PARAM_FAILURE_REASON" ]; then
  args+=(--failure-reason="$PARAM_FAILURE_REASON")
fi
circleci run release update "$PARAM_DEPLOY_NAME" \
  --status="$PARAM_STATUS" \
  "${args[@]}"
