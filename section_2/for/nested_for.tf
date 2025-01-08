locals {
  list1 = [1, 2, 3]
  list2 = [4, 5, 6]
  x     = range(3)
  y     = range(1, 10)

  two_d_array = [
    for data in local.list1 : [
      for value in local.list2 : "${data} ${value}"
    ]
  ]

  # This will crete a list of 3 lists. The inner lists will each contain numbers from 1 to 9
  two_d_array2 = [
    for x in local.x : [
      for y in local.y : y
    ]
  ]
}
