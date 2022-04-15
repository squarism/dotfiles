abbr -a -U -- ... 'cd ../..'
abbr -a -U -- b bundle
abbr -a -U -- be 'bundle exec'
abbr -a -U -- dcu 'docker-compose up'
abbr -a -U -- ec 'iex -S mix'
abbr -a -U -- g git
abbr -a -U -- glg 'git log --graph --oneline --decorate --color'
abbr -a -U -- glgg 'git log --graph --abbrev-commit --decorate --date=relative --all'
abbr -a -U -- gpr 'git pull --rebase --prune'
abbr -a -U -- gst 'git status'
abbr -a -U -- listening 'lsof -Pn -i | grep LISTEN'
abbr -a -U -- locate mdfind
abbr -a -U -- ls exa
abbr -a -U -- pr 'poetry run'
abbr -a -U -- prm 'poetry run python manage.py'
abbr -a -U -- redis redis-cli
abbr -a -U -- sanity 'bundle exec rake db:reset RAILS_ENV=test; bundle exec rspec; if test $status = 0; bundle exec rubocop; bundle exec rake webpacker:clean; yarn test; end'
abbr -a -U -- squash 'git commit -m "squash"; git rebase -i head~2'
abbr -a -U -- t 'exa -l -T -L 2 --header --git-ignore -F -d -I node_modules'
abbr -a -U -- telnet 'nc -vz'
abbr -a -U -- ts 'npx ts-node'
abbr -a -U -- uuidgen uuidgen\ \|\ tr\ \'\[:upper:\]\'\ \'\[:lower:\]\'
abbr -a -U -- vi nvim
abbr -a -U -- vim nvim
abbr -a -U -- wr 'watchexec -c bundle exec rspec '
abbr -a -U -- yic 'git checkout origin/master -- yarn.lock; yarn install; git add yarn.lock; git rebase --continue'
