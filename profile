# EC2 stuff
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export EC2_HOME=~/Apps/ec2
export EC2_PRIVATE_KEY=~/.ec2/cert-private-key.pem
export EC2_CERT=~/.ec2/cert-public-key.pem
export EC2_ACCNO=CHANGEME
export ACCESS_KEY=CHANGEME
export SECRET_KEY=CHANGEME

export VIM_APP_DIR=~/Apps

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

export NODE_PATH=/usr/local/lib/node_modules

# custom user bin for great justice -- chris
export PATH=~/bin:/usr/local/share/npm/bin:/usr/local/bin:$EC2_HOME/bin:$PATH
