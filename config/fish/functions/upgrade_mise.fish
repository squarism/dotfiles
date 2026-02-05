# for upgrading languages in-place globally with mise
function upgrade_mise
  set -l tool $argv[1]
  set -l from $argv[2]
  set -l to $argv[3]

  if test (count $argv) -lt 3
    echo "Usage: upgrade_mise <tool> <from_version> <to_version>" >&2
    return 1
  end

  # check old version exists
  if not mise list $tool | grep -q $from
    echo "Error: $tool@$from not found" >&2
    return 1
  end

  echo "Upgrading $tool $from -> $to ..."
  mise install $tool@$to
  mise uninstall $tool@$from
  mise use --global $tool@$to
end
