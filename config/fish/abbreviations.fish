# Put any and all abbreviations you want in this file
# equivalent of aliases in zsh/bash
# except they don't need to run every time, so you can just define these
# once and then comment them out?  TODO: this is weird.

abbr -a -- asdf mise  # muscle
abbr -a -- b bundle
abbr -a -- be 'bundle exec'
abbr -a -- certshow 'openssl x509 -text -noout -in'
abbr -a -- dcu 'docker-compose up'
abbr -a -- dps 'docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}"'
abbr -a -- dnskill 'sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
abbr -a -- ec 'iex -S mix'
abbr -a -- g git
abbr -a -- glg 'git log --graph --oneline --decorate --color'
abbr -a -- gpr 'git pull --rebase --prune --tags'
abbr -a -- gst 'git status'
abbr -a -- gcan! 'git commit -v -a --no-edit --amend'
abbr -a -- jw 'npx jest --watch'
abbr -a -- listening 'lsof -Pn -i | grep LISTEN'
abbr -a -- locate mdfind
abbr -a -- ls eza
abbr -a -- mist mise
abbr -a -- nr 'pnpm run'
abbr -a -- pic 'git checkout origin/main -- pnpm-lock.yaml; pnpm i; git add pnpm-lock.yaml; git rebase --continue'
abbr -a -- pr 'poetry run'
abbr -a -- random_passwd 'openssl rand -hex 16'
abbr -a -- redis redis-cli
abbr -a -- sanity 'bundle exec rake db:reset RAILS_ENV=test; bundle exec rspec --fail-fast; if test $status = 0; bundle exec rubocop; yarn test; end'
abbr -a -- squash 'git commit -m "squash"; git rebase -i head~2'
abbr -a -- telnet 'nc -vz'
abbr -a -- uuidgen uuidgen\ \|\ tr\ \'\[:upper:\]\'\ \'\[:lower:\]\'
abbr -a -- vi nvim
abbr -a -- vim nvim
abbr -a -- wr 'watchexec --clear -f "*.rb" "bundle exec rspec"'
