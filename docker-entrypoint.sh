#!/bin/bash

# search by systcl properties on all environment variables
env | while IFS='=' read -r env_name env_value ; do

  # transform to lowercase
  env_name=$(echo $env_name | tr '[:upper:]' '[:lower:]')

  # check if variable starts with sysctl
  if echo $env_name | grep -q ^sysctl\. ; then

    # extract key name
    key=${env_name#*.}

    # get the value of sysctl key
    result=$(sysctl $key 2>&1)

    # check return code from sysctl
    if [[ $? -eq "0" ]]; then

      # get current value
      old_value=${result#*=}

      # setting new value
      new_value=$env_value

      # check values
      if [ old_value != new_value ]; then

        # changing value 
        sysctl -w $key=$new_value > /dev/null

        # notify changing
        echo $(date) - $USER - INFO  - changed successfully. sysctl key $key = $new_value.
      else

        # notify not changing
        echo $(date) - $USER - WARN  - unchanged property. sysctl key $key already has $old_value.
      fi

    fi

  fi
done

# perform container command
exec "$@"
