ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" 

# Flags scripts to use experiment branch for the samples
export SAMPLE_BRANCH=experiment

# get app templates
$ROOTDIR/scripts/update-tekton-definition
$ROOTDIR/scripts/import-gitops-template
$ROOTDIR/scripts/import-ai-lab-samples
