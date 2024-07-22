#!/bin/zsh

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: create_pre_commit.sh <username> <email>"
  exit 1
fi

USER_NAME=$1
EMAIL=$2

# Validate that username and email are not empty
if [ -z "$USER_NAME" ] || [ -z "$EMAIL" ]; then
  echo "Error: Both username and email must be provided."
  exit 1
fi

# Get the current directory
REPO_PATH=$(pwd)

# Check if the current directory is a git repository
if [ ! -d "$REPO_PATH/.git" ]; then
  echo "Error: The current directory is not a git repository."
  exit 1
fi

# Create the pre-commit hook script
HOOK_PATH="$REPO_PATH/.git/hooks/pre-commit"

cat <<EOL > $HOOK_PATH
#!/bin/sh

EXPECTED_USER_NAME="$USER_NAME"
EXPECTED_USER_EMAIL="$EMAIL"

CURRENT_USER_NAME=\$(git config user.name)
CURRENT_USER_EMAIL=\$(git config user.email)

if [ "\$CURRENT_USER_NAME" != "\$EXPECTED_USER_NAME" ] || [ "\$CURRENT_USER_EMAIL" != "\$EXPECTED_USER_EMAIL" ]; then
  echo "Error: Git user is not correctly configured for this repository."
  echo "Expected: \$EXPECTED_USER_NAME <\$EXPECTED_USER_EMAIL>"
  echo "Current: \$CURRENT_USER_NAME <\$CURRENT_USER_EMAIL>"
  exit 1
fi
EOL

# Make the pre-commit hook executable
chmod +x $HOOK_PATH

echo "pre-commit hook created at $HOOK_PATH with user <$USER_NAME> <$EMAIL>"