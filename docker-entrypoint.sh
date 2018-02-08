#!/bin/sh

# search by systcl properties on all environment variables
env | while IFS='=' read -r env_name env_value ; do

  # transform to lowercase
  declare -l env_name

  # check if variable starts with sysctl
  if [[ $env_name == "sysctl"* ]]; then

    # extract key name
    key=${env_name#*_}

    # get the value of sysctl key
    result=$(sysctl $key 2>&1)

    # check return code from sysctl
    if [[ $? -eq "0" && ! -z $env_value ]]; then

      # get current value
      old_value=${result#*=}
      
      # setting new value
      new_value=$env_value

      # changing value 
      sysctl --write $key=$new_value

      # result
      if [[ $? -eq "0" ]]; then
        echo $(date) - $USER - INFO  - Changing value of sysctl key $key from $old_value to $new_value.
      fi

    fi

  fi
done

# perform container command
exec "$@"
