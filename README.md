Add a mechanism to encrypt secrets inline on playbooks.

- Add a jinja filter to replace encrypted variables with their decrypted value
- Add a test gpg key pair
- Add a test gpg_passphrase variable that needs to be replaced with a production one and encrypted with ansible vault
- Add a test playbook that proves tht everything works
- Add a encrypt.sh shell script that uses the public key to encrypt a string that the user can copy and paste inside a playbook

Benefits:
 - Anyone can encrypt secrets but not decrypt
 - Cleaner variables files and playbooks, you can encrypt only the secret and not the whole file

Requirements:
The python-gnupg needs to be installed on the machine that ansible is running (not on the servers that are provisioned). So it needs to be installed on ansible tower.
