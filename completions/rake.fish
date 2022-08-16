function __cache_or_get_rake_completion -d "Create rake completions"
  mkdir -p "/tmp/rake_cache_$USER"
  set -l hashed_pwd (md5pwd)
  set -l cache_file "/tmp/rake_cache_$USER/$hashed_pwd"

  if not test -f "$cache_file"
    rake -T 2>&1 | sed -e "s/^rake \([a-z:_0-9!\-]*\).*#\(.*\)/\1\t\2/" > "$cache_file"
  end
  cat "$cache_file"
end

function __run_rake_completion
  test -f rakefile; or test -f Rakefile; or test -f rakefile.rb; or test -f Rakefile.rb
end

complete -x -c rake -a "(__cache_or_get_rake_completion)" -n __run_rake_completion

complete -c rake -l backtrace --description "Enable full backtrace.  OUT can be stderr (default) or stdout."
complete -c rake -l comments --description "Show commented tasks only"
complete -c rake -l job-stats --description "Display job statistics. LEVEL=history displays a complete job list"
complete -c rake -l rules --description "Trace the rules resolution"
complete -c rake -l rules --description "Trace the rules resolution."
complete -c rake -l suppress-backtrace --description "Suppress backtrace lines matching regexp PATTERN. Ignored if --trace is on."
complete -c rake -s A -l all --description "Show all tasks, even uncommented ones (in combination with -T or -D)"
complete -c rake -s B -l build-all --description "Build all prerequisites, including those which are up-to-date."
complete -c rake -s C -l classic-namespace --description "Put Task and FileTask in the top level namespace"
complete -c rake -s C -l directory --description "Change to DIRECTORY before doing anything."
complete -c rake -s D -l describe --description "Describe the tasks (matching optional PATTERN), then exit"
complete -c rake -s E -l execute-continue -x --description "Execute some Ruby code, then continue with normal task processing"
complete -c rake -s G -l no-system -l nosystem --description "Use standard project Rakefile search paths, ignore system wide rakefiles"
complete -c rake -s H -s h -l help --description "Display help message"
complete -c rake -s I -l libdir -x --description "Include LIBDIR in the search path for required modules"
complete -c rake -s N -l no-search -l nosearch --description "Do not search parent directories for the Rakefile"
complete -c rake -s P -l prereqs --description "Display the tasks and dependencies, then exit"
complete -c rake -s R -l rakelibdir -l rakelib -x --description "Auto-import any .rake files in RAKELIBDIR. (default is 'rakelib')"
complete -c rake -s T -l tasks --description "Display the tasks (matching optional PATTERN) with descriptions, then exit. -AT combination displays all of tasks contained no description."
complete -c rake -s V -l version --description "Display the program version"
complete -c rake -s W -l where --description "Describe the tasks (matching optional PATTERN), then exit."
complete -c rake -s X -l no-deprecation-warnings --description "Disable the deprecation warnings."
complete -c rake -s e -l execute -x --description "Execute some Ruby code and exit"
complete -c rake -s f -l rakefile --description "Use FILENAME as the rakefile to search for."
complete -c rake -s g -l system --description "Using system wide (global) rakefiles (usually '~/.rake/*.rake')"
complete -c rake -s j -l jobs --description "Specifies the maximum number of tasks to execute in parallel. (default is number of CPU cores + 4)"
complete -c rake -s m -l multitask --description "Treat all tasks as multitasks."
complete -c rake -s n -l dry-run --description "Do a dry run without executing actions"
complete -c rake -s p -l execute-print -x --description "Execute some Ruby code, print the result, then exit"
complete -c rake -s q -l quiet --description "Do not log messages to standard output"
complete -c rake -s r -l require -x --description "Require MODULE before executing rakefile"
complete -c rake -s s -l silent --description "Like --quiet, but also suppresses the 'in directory' announcement"
complete -c rake -s t -l trace --description "Turn on invoke/execute tracing, enable full backtrace"
complete -c rake -s v -l verbose --description "Log message to standard output (default)"
