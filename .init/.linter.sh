#!/bin/bash
cd /home/kavia/workspace/code-generation/camp-coordination-platform-18763-18772/hme_camp_frontend
npm run build
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
   exit 1
fi

