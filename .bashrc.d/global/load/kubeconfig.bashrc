KUBCONFIG_DIR=${HOME}/.kube

# Now import additional config files
OIFS=${IFS}
IFS=$'\n'
for kubeconfigFile in $(find "${KUBCONFIG_DIR}" \( -type f -or -type l \) -and \( -name "*.yml" -or -name "*.yaml" -or -name "config" \) )
do
    logDebug "kubeconfig: adding ${kubeconfigFile} to KUBECONFIG"
    export KUBECONFIG="${kubeconfigFile}:${KUBECONFIG}"
done
IFS="${OIFS}"
