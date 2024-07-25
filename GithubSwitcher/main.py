import argparse
import subprocess

def switch_account(account):
    if account == "account1":
        script = "/Users/siraryanmichael/Downloads/GitHubSwitcher/switch_to_account1.sh"
    elif account == "account2":
        script = "/Users/siraryanmichael/Downloads/GitHubSwitcher/switch_to_account2.sh"
    else:
        print("Unknown account")
        return

    try:
        subprocess.run(["bash", script], check=True)
        print(f"Switched to {account}")
    except subprocess.CalledProcessError as e:
        print(f"Failed to switch to {account}: {e}")

def main():
    parser = argparse.ArgumentParser(description="Switch between GitHub accounts")
    parser.add_argument("account", choices=["account1", "account2"], help="The account to switch to")
    args = parser.parse_args()
    switch_account(args.account)

if __name__ == "__main__":
    main()
