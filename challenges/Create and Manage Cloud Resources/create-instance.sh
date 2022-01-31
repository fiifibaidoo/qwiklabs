#!/bin/bash

printf "Enabling Container APIs..."
gcloud compute instances create nucleus-jumphost --machine-type f1-micro > /dev/null 2>&1
printf "Completed.\n"