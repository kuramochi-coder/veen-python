landingzone = {
  backend_type = "azurerm"
  level        = "level0"
  key          = "launchpad"
}

# naming convention settings
# for more settings on naming convention, please refer to the provider documentation: https://github.com/aztfmod/terraform-provider-azurecaf
#
# passthrough means the default CAF naming convention is not applied and you are responsible
# of the unicity of the names you are giving. the CAF provider will clear out
passthrough = true
# adds random chars at the end of the names produced by the provider
random_length = 0

# Inherit_tags defines if a resource will inherit it's resource group tags
inherit_tags = true

# Default region. When not set to a resource it will use that value
default_region = "region1"

regions = {
  region1 = "southeastasia"
}

launchpad_key_names = {
  tfstates = [
    "level0",
    "level1",
    "level2",
    "level3",
    "level4",
    "ven"
  ]
}

tags = {
  agency-code = "spf"
}

resource_groups = {
  level0 = {
    name = "rg-n-gven-p-eztflvl0"
    tags = {
      level        = "level0"
      project-code = "ven"
      env          = "prd"
      purpose      = "CAF base setup for VEEN level 0 resource group"
    }
  }
  level1 = {
    name = "rg-n-gven-p-eztflvl1"
    tags = {
      level        = "level1"
      project-code = "ven"
      env          = "prd"
      purpose      = "CAF base setup for VEEN level 1 resource group"
    }
  }
  level2 = {
    name = "rg-n-gven-p-eztflvl2"
    tags = {
      level        = "level2"
      project-code = "ven"
      env          = "prd"
      purpose      = "CAF base setup for VEEN level 2 resource group"
    }
  }
  level3 = {
    name = "rg-n-gven-p-eztflvl3"
    tags = {
      level        = "level3"
      project-code = "ven"
      env          = "prd"
      purpose      = "CAF base setup for VEEN level 3 resource group"
    }
  }
  level4 = {
    name = "rg-n-gven-p-eztflvl4"
    tags = {
      level        = "level4"
      project-code = "ven"
      env          = "prd"
      purpose      = "CAF base setup for VEEN level 4 resource group"
    }
  }
  ven = {
    name = "rg-n-gven-p-eztfveen"
    tags = {
      level        = "ven"
      project-code = "ven"
      env          = "prd"
      purpose      = "CAF base setup for VEEN resource group"
    }
  }
}