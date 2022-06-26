# https://github.com/evertramos/nginx-proxy-automation

if [[ $# -eq 0 ]]; then
  echo "ERROR: You must pass in the email you'd like to use for nginx. Exiting."
  exit 1
fi

email=$1
git clone --recurse-submodules https://github.com/evertramos/nginx-proxy-automation.git proxy
cd proxy/bin && ./fresh-start.sh --yes -e $email --skip-docker-image-check
