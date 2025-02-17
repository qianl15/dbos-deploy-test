#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install 22
nvm use 22

npm i -g @dbos-inc/dbos-cloud@latest

pip install -r requirements.txt

set -e

dbos-cloud login --with-refresh-token "${DBOS_REFRESH_TOKEN}"
dbos-cloud app deploy
