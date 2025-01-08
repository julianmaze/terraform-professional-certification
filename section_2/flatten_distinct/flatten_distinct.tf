locals {
  flat = flatten([[1, 2], ["a", "b"], [true, false]])
  /*
  > local.flat
  [
    1,
    2,
    "a",
    "b",
    true,
    false,
  ]
  */

  instance_configs = [
    {
      name = "web"
      tags = ["http", "https", "web"]
    },
    {
      name = "app"
      tags = ["application", "backend", "http", "https"]
    }
  ]

  tags = distinct(flatten([for data in local.instance_configs : data.tags]))
  /*
  > local.tags
  tolist([
    "http",
    "https",
    "web",
    "application",
    "backend",
  ])
  */
}
