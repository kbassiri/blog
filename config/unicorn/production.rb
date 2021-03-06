# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.

worker_processes 3

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.

working_directory "/u/apps/blog/current"

# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy

#listen "/u/apps/blog/shared/blog.socket", :backlog => 64
listen 5000, :tcp_nopush => true

# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30

#user 'ubuntu', 'staff'
shared_path = "/u/apps/blog/shared"
pid "#{shared_path}/pids/unicorn.pid"

stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

