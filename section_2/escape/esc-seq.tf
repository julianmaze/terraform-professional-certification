locals {
  # We want to output "hello" not hello
  esc_seq_string = "\"hello\""

  # \ not the escape sequence
  esc_seq_backslash = "\\"

  # tab - useful for aligning text
  esc_seq_tab = "Item:\tValue"

  # newline
  esc_seq_newline = "Hello\nWorld"
}
