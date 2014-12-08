#!/usr/bin/env ruby

# go into each all the git projects and do a `git pull`
# this is mainly used to update apps which use git to deliver updates
# for example, rbenv & vim plugins

projects = %w(
  ~/.janus/*
  ~/.oh-my-zsh
  ~/src/vendor/*
)

def git_pull(path)
  git_output = `cd #{path} && git pull`
  status = git_output.split("\n").last
  puts "#{path.split("/").last}: \033[33m#{status}\033[0m"
end

def sub_dirs_from(path)
  # we need to replace the tilde with HOME if the path has globs/stars
  dir = path.gsub /^\~/, ENV['HOME']
  dirs = Dir.glob(dir)
  dirs.select {|entry| File.directory? entry }
end

def update_homebrew
  puts `brew update`
  puts `brew upgrade`
  puts `brew cleanup`
end

def spacer
  puts "-" * 65
end

puts "UPDATING ALL GIT REPOS"
projects.each do |proj|
  # if a path ends in * then we need to go into each one and do a git pull
  if proj.match /\*$/
    sub_dirs_from(proj).each do |path|
      git_pull path
    end
  # otherwise, just do a git pull
  else
    git_pull proj
  end
end

puts "UPDATING HOMEBREW"
spacer
update_homebrew

puts "CLEARING CACHES"
spacer
`bower cache clean`
`npm cache clean`

puts "UPDATING NPM"
spacer
`npm update`

puts "UPDATING RVM"
spacer
`rvm get stable`

puts "UPDATING GOLANG PACKAGES (silent)"
spacer
`go get -u all > /dev/null 2>&1`
puts "Done with golang update."
