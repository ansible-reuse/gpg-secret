#!/usr/bin/python

import gnupg
import os


encrypted_string_template = \
"""-----BEGIN PGP MESSAGE-----
Version: GnuPG v1
{}
-----END PGP MESSAGE-----"""


def decrypt(encrypted_string, passphrase=None, keys_dir=None):

    passphrase = passphrase or os.environ.get('GPG_PASS')
    keys_dir = keys_dir or os.path.join(os.path.dirname(os.path.realpath(__file__)), '.gnupg')

    gpg = gnupg.GPG(gnupghome=keys_dir)

    encrypted_string = encrypted_string_template.format(encrypted_string)

    decrypted_data = gpg.decrypt(encrypted_string, passphrase=passphrase)
    if not decrypted_data.ok:
        raise Exception(decrypted_data.status)
    return str(decrypted_data)


from ansible.module_utils.basic import *

class FilterModule(object):
    def filters(self):
        return {
            'decrypt': decrypt
        }
