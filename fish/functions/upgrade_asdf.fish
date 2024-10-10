function upgrade_asdf
  echo "Updating plugins ..."
  asdf plugin-update --all > /dev/null

  set -l language $argv[1]
  set -l from $argv[2]
  set -l to $argv[3]

  echo "Upgrading $language $from -> $to in-place ..."

  asdf install $language $to
  asdf uninstall $language $from
  asdf global $language $to
end
