import pandas as pd
import glob
from venv import create
from sys import argv


# Class below takes in an object, it then removes the quotes and colons to prepare for tfvars syntax
class DictWithoutQuotedKeys(dict):
    def __repr__(self):
        # Strip quotes and colons from keys and append to string s
        s = "\n{"
        for key in self:
            s += "{0}=".format(key)

            if isinstance(self[key], dict):
                # Apply formatting recursively
                s += "{0}, ".format(DictWithoutQuotedKeys(self[key]))
            else:
                # Quote all the values
                s += "\"{0}\"\n ".format(self[key])
        if len(s) > 1:
            s = s[0: -2]
        s += "}\n"
        return s

# Function below reads a csv file with Headers and converts to json file.
def nsg_generator(terraform_variable_name):
    # Get all csv files within the current directory.
    path = "./*.csv"
    files = glob.glob(path)

    # For every csv file, we read it and generate the json output with the exact filename.
    for file in files:
        csv_filename = file.split(".")[1]
        tfvars_output_filename = f".{csv_filename}.auto.tfvars"

        # Read csv file content and output as object.
        df = pd.read_csv(file)
        dict_output = df.to_dict('records')

        # Prepare the formatting requited, which is an array of objects for the terraform variable 
        final_output_array = []
        for single_obj in dict_output:
            tfvars_obj = DictWithoutQuotedKeys(single_obj)
            final_output_array.append(tfvars_obj)
        
        # Create a tfvars file and write the object 
        with open(tfvars_output_filename, 'w') as file:
            file.write(f'{terraform_variable_name} = {final_output_array}')

if __name__ == "__main__":
    variable_name = argv[1]
    nsg_generator(variable_name)
