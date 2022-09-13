import hcl2

with open('configuration.tfvars', 'r') as file:
    tfvars_obj = hcl2.load(file)
print(tfvars_obj['landingzone']['level'])