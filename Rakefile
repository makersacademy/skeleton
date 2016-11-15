require 'middleman-gh-pages'

namespace :assets do
  task :precompile do
    sh 'middleman build --verbose'
  end
end

namespace :publish do
  desc "Publishes to your domain"
  task :domain do
    print "What is the name of your domain? e.g. staging.makersacademy.com:\n"
    domain = gets.chomp
    print "\n"
    push_to_domain(domain)
  end
end

def push_to_domain(domain)
  print "What is the git clone URL of the repository for this website? e.g. https://github.com/makersacademy/website.git:\n"
  git_url = gets.chomp
  push_to_github(git_url)
  print "\n"
  print "Deploying now...if you have CI enabled for this project, please watch there for deployment updates.\n"
end

def push_to_github(git_url)
  `git remote add production #{ git_url } 2>/dev/null`
  current_branch = `git rev-parse --abbrev-ref HEAD`
  `git push --force production #{current_branch.strip}:master`
end