#!/bin/bash
set -e
read -s -p "GIT profile: " profile

case $profile in
  personal) # Set up for email millomilk2022@gmail.com(personal)
    git config user.name "Millo Milk"
    git config user.email "millomilk2022@gmail.com"
    ;;
  official) # Set up for email vukieuhaihoa@gmail.com(official email)
    git config user.name "Hai Hoa"
    git config user.email "vukieuhaihoa@gmail.com"
    ;;
  *) # Default case
    echo "ERR: Unknown profile: $profile"
    exit 1
esac

