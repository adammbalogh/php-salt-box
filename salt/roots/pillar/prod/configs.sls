nginx:
  vhost:
    cache_static_files: "on"

php:
  display_errors: "Off"
  display_startup_errors: "Off"
  error_reporting: "E_ALL & ~E_DEPRECATED & ~E_STRICT"
  track_errors: "Off"
  session:
    gc_maxlifetime: 7200
  xdebug:
    remote_enable: 0
    profiler_enable: 0