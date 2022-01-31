#!/bin/bash
printf "Rebuilding with new tag...\n"
. rebuild.sh
printf "Completed successfully \n"

printf "Publishing rebuilt container...\n"
. publish.sh
printf "Completed successfully \n"