task :checks_for_laziness => :environment do
  Goal.check_for_laziness(300)
end
