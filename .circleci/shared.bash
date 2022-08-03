#!/bin/bash

set -exuo pipefail

function commiter_email() {
  set +x
  git log -n 1 --format='%ae'
  set -x
}

function webhook_payload() {
  set +x
  COMMITER_EMAIL=$(commiter_email)
  CURRENT_DATE=$(date)
  jq --null-input \
    --arg reponame $CIRCLE_PROJECT_REPONAME \
    --arg username $CIRCLE_PROJECT_USERNAME \
    --arg branch $CIRCLE_BRANCH \
    --arg build_num $CIRCLE_BUILD_NUM \
    --arg build_url $CIRCLE_BUILD_URL \
    --arg author_email $COMMITER_EMAIL \
    --arg end_time "$CURRENT_DATE" \
    '{
      "payload": {
        "status": "success",
        "outcome":"success",
        "username": $username,
        "reponame": $reponame,
        "branch": $branch,
        "build_num": $build_num,
        "build_url": $build_url,
        "author_email": $author_email,
        "steps": [
          {
            "actions": [
              {"end_time": $end_time }
            ]
          }
        ]
      }
    }'
  set -x
}

function send_webhook() {
  set +x
  PAYLOAD=$(webhook_payload)
  curl -i -X POST https://cc-slack-proxy.herokuapp.com/circle \
    -H 'Content-Type: application/json' \
    -d "$PAYLOAD"
  set -x
}
