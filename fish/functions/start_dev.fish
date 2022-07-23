function start_dev
  sudo service postgresql start
  sudo service redis-server start
  puma-dev -sysbind &
end
