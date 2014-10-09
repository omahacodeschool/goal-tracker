if ENV["RAILS_ENV"] == "development"
  worker_processes 1
  timeout 10000
else
  worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
  timeout 15
  preload_app true
end