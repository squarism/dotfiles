# Put any and all abbreviations you want in this file
# equivalent of aliases in zsh/bash
# except they don't need to run every time, so you can just define these
# once and then comment them out?  TODO: this is weird.

# abbr -a -U -- b bundle
# abbr -a -U -- be 'bundle exec'
# abbr -a -U -- certshow 'openssl x509 -text -noout -in'
# abbr -a -U -- dcu 'docker-compose up'
# abbr -a -U -- ec 'iex -S mix'
# abbr -a -U -- g git
# abbr -a -U -- glg 'git log --graph --oneline --decorate --color'
# abbr -a -U -- gpr 'git pull --rebase --prune'
# abbr -a -U -- gst 'git status'
# abbr -a -U -- gcan! 'git commit -v -a --no-edit --amend'
# abbr -a -U -- listening 'lsof -Pn -i | grep LISTEN'
# abbr -a -U -- locate mdfind
# abbr -a -U -- nr 'pnpm run'
# abbr -a -U -- pr 'poetry run'
# abbr -a -U -- random_passwd 'openssl rand -hex 16'
# abbr -a -U -- redis redis-cli
# abbr -a -U -- sanity 'bundle exec rake db:reset RAILS_ENV=test; bundle exec rspec --fail-fast; if test $status = 0; bundle exec rubocop; yarn test; end'
# abbr -a -U -- squash 'git commit -m "squash"; git rebase -i head~2'
# abbr -a -U -- t 'exa -l -T -L 2 --header --git-ignore -F -d -I node_modules'
# abbr -a -U -- telnet 'nc -vz'
# abbr -a -U -- uuidgen uuidgen\ \|\ tr\ \'\[:upper:\]\'\ \'\[:lower:\]\'
# abbr -a -U -- vi nvim
# abbr -a -U -- vim nvim
# abbr -a -U -- wip 'git commit -m "wip"'
# abbr -a -U -- wr 'watchexec -c bundle exec rspec '
# abbr -a -U -- yic 'git checkout origin/master -- yarn.lock; yarn install; git add yarn.lock; git rebase --continue'
