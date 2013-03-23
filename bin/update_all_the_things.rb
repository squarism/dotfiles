#!/usr/bin/env ruby

# go into each all the git projects and do a `git pull`
# this is mainly used to update apps which use git to deliver updates
# for example, rbenv & vim plugins

projects = %w(
  ~/.vim/bundle/*
  ~/.oh-my-zsh
  ~/.rbenv
  ~/.rbenv/plugins/*
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

update_homebrew
