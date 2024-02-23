zj() {
  case "$1" in
    n)
      zellij --session
      ;;
    k)
      zellij kill-session
      ;;
    ka)
      zellij kill-all-sessions
      ;;
    *)
      zellij "$@"
      ;;
  esac
}

fcd() {
  local dir
  dir=$(find ${1:-.} -type d -not -path '*/\.*' 2> /dev/null | fzf +m) && cd "$dir"
}

killit() {
  if [ $# -ne 1 ]; then
    echo "Usage: port <port_number>"
    return 1
  fi

  local port_number="$1"
  local process_info

  process_info=$(lsof -i :$port_number | grep LISTEN)

  if [ -z "$process_info" ]; then
    echo "No process found listening on port $port_number"
    return 1
  fi

  local pid
  pid=$(echo "$process_info" | awk '{print $2}')

  echo "Process using port $port_number:"
  echo "$process_info"

  read -q "confirm?Do you want to kill the process using this port? (y/n): "

  if [[ "$confirm" == "y" ]]; then
    kill -9 "$pid"
    echo "Process with PID $pid has been killed."
  else
    echo "Process with PID $pid was not killed."
  fi
}