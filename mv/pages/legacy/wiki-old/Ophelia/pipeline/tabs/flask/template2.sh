#!/bin/bash

# Ask for project name
read -p "Enter your Flask project name: " project_name

# Validate project name
if [ -z "$project_name" ]; then
    echo "Project name cannot be empty."
    exit 1
fi

# Ask for directory location
read -p "Enter directory path for the project (press Enter for home directory): " custom_dir

# Set project directory
if [ -z "$custom_dir" ]; then
    project_dir="$HOME/$project_name"
else
    # Remove trailing slash if present
    custom_dir="${custom_dir%/}"
    project_dir="$custom_dir/$project_name"
fi

# Check if directory exists
if [ -d "$project_dir" ]; then
    echo "Directory $project_dir already exists."
    exit 1
fi

# Validate directory path
parent_dir=$(dirname "$project_dir")
if [ ! -d "$parent_dir" ]; then
    echo "Parent directory $parent_dir does not exist."
    read -p "Would you like to create it? (y/n): " create_parent
    if [ "$create_parent" = "y" ] || [ "$create_parent" = "Y" ]; then
        mkdir -p "$parent_dir"
    else
        echo "Aborting."
        exit 1
    fi
fi

# Rest of your existing code remains the same, starting from:
# Create enhanced project structure
mkdir -p "$project_dir/templates"
...
