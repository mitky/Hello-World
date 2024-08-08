#!/bin/bash

# Number of parallel builds
BUILD_COUNT=10

# Path to your Cloud Build configuration file
CONFIG_FILE="../cloudbuild.yaml"

# Trigger builds in parallel
for i in $(seq 1 $BUILD_COUNT); do
    echo "Triggering build $i"
    gcloud builds submit --config=$CONFIG_FILE &
done

# Wait for all background processes to complete
wait

echo "All builds triggered."
