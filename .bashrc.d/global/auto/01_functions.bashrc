# load source from bashrc.d/**/load
function bashload() {
    local name=${1}
    local bashrcd_dir=${BASHRC_DIR:-${HOME}/.bashrc.d}

    for auto_dir in $(find "${bashrcd_dir}" -type d -name "load"); do
        for file in $(find "${auto_dir}" -type f -name "${name}.bashrc"); do
            logInfo "bashload: loading ${file}"
            source "${file}"
        done
    done
}

function activate() {
    local POTENTIAL_PATHS=( '.env' 'env' '.venv' 'venv' )

    for path in ${POTENTIAL_PATHS[@]}; do
        if [ -d "${path}" ]; then
            if [ -f "${path}/bin/activate" ]; then
                logInfo "activating virtualenv in $(realpath ${path} )"
                source "${path}/bin/activate"
                break
            fi
        fi
    done
}

function e() {
    nvim $@
}
