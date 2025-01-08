locals {
  basic_heredoc_string = <<EOF
  This is a heredoc string
    that spans multiple lines
      and can contain "quotes" and 'apostrophes' and tabs
  The indentation is preserved in the output
  EOF

  indented_heredoc_string = <<-ABC
  This is another heredoc string
    that spans multiple lines
      and can contain "quotes" and 'apostrophes' and tabs
  The indentation is stripped from the output
  ABC

  map = {
    basic_nested_heredoc_key    = <<EOF
    This is a heredoc string
      that spans multiple lines
        and can contain "quotes" and 'apostrophes' and tabs
    Note that the indentation is preserved in the output
    EOF
    indented_nested_heredoc_key = <<-ABC
    This is another heredoc string
      that spans multiple lines
        and can contain "quotes" and 'apostrophes' and tabs
    Note that the indentation is stripped from the output
    ABC
  }
}
