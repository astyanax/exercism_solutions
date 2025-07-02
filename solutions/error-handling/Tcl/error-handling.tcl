proc custom_error_message {message} {
  return -code error $message
}

proc handle_error {script} {
  try {
    uplevel $script
  } trap {ARITH DIVZERO} {} {
    return "division by zero"
  } trap {POSIX ENOENT} {} {
    return "file does not exist"
  } trap {TCL LOOKUP COMMAND} {} {
    return "proc does not exist"
  } on error {err opts} {
    puts stderr "unknown error: $err"
    return -code error {*}$opts
  }
  return "success"
}
