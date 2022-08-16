function rake_cache_clear
  mkdir -p "/tmp/rake_cache_$USER"
  set -l hashed_pwd (md5pwd)
  rm -rf "/tmp/rake_cache_$USER/$hashed_pwd"
end
