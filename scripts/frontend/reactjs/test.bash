#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "TEST React.js App"
npm --prefix ../../../frontend/reactjs run test