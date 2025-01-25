import {
  to = module.ec2.aws_instance.ec2["subnet-00debda42ffe736e2"]
  id = "i-0e2126ba49fb24587"
}
import {
  to = module.ec2.aws_instance.ec2["subnet-024c394a305e5a783"]
  id = "i-03535e82aceec11a9"
}

import {
  to = module.sg.aws_security_group.sg["app-1-sg"]
  id = "sg-0e0e07dd44d3399cb"
}
import {
  to = module.sg.aws_security_group.sg["app-2-sg"]
  id = "sg-0190e4bc4c5f2ee98"
}

import {
  to = module.sg.aws_vpc_security_group_egress_rule.egress["rule_1"]
  id = "sgr-08aa991a7cedeb8a9"
}
import {
  to = module.sg.aws_vpc_security_group_egress_rule.egress["rule_3"]
  id = "sgr-09b84735e8152167c"
}
import {
  to = module.sg.aws_vpc_security_group_egress_rule.egress["rule_4"]
  id = "sgr-03987baf93ee98539"
}


import {
  to = module.sg.aws_vpc_security_group_ingress_rule.ingress["rule_0"]
  id = "sgr-0b447aa1155a095c1"
}
import {
  to = module.sg.aws_vpc_security_group_ingress_rule.ingress["rule_2"]
  id = "sgr-053988a3873a0412c"
}
import {
  to = module.sg.aws_vpc_security_group_ingress_rule.ingress["rule_5"]
  id = "sgr-02b468cf13e1f5738"
}
