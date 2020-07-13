---
title: "2 SSH Introduction"
date: 2020-02-26
draft: false
---

## Tworzenie kluczy ssh

```.sh
# On your local computer, generate a SSH key pair by typing:
ssh-keygen
# Next, copy your Public Key Using SSH-Copy-ID
ssh-copy-id -i ~/.ssh/mypubkey user@your.server.example.com
# Keys need to be only readable by you:
chmod 400 ~/.ssh/myprivkey
# if you used an already existing key don't forger to add it to the ssh agent on the local machine
ssh-add ~/.ssh/myprivkey
# if `ssh-add` fails saying `Could not open a connection to your authentication agent.` you have to start the ssh-agent
eval `ssh-agent -s`


# login using specific key
ssh -o IdentitiesOnly=yes -i ~/.ssh/example_rsa user@your.server.example.com
# login using password (even if pubkey is available)
ssh -o PubkeyAuthentication=no user@your.server.example.com

# remove old key
ssh-keygen -f $HOME/.ssh/known_hosts -R your.server.example.com
```

## SSH - logowanie

```.sh
#to login
ssh user@your.server.example.com
#to copy (overwrites) from remote machine to local one
scp -r user@your.server.example.com:/path/to/source_folder /home/user/Desktop/destination_folder
#to mount remote folder at local machine
sshfs user@your.server.example.com:/path/to/source_folder /home/user/Desktop/destination_folder
#to synchronize (only new files) content of the local folder with a remote one (or vice versa)
rsync -avzhe ssh --progress /home/user/Desktop/source_folder/  user@your.server.example.com:/path/to/destination_folder/

#If you need to exclude the sub-directories that dont contain the file and still retain the directory structure, use
rsync -zarv  --prune-empty-dirs --include "*/"  --include="*.csv" --exclude="*" "$FROM" "$TO"
```

Uwagi

- `-C` - włącza kompresję (w przypadku pliku skompresowanego nie ma to
    sensu)
- `-p` - zachowuje oryginalną datę stworzenia pliku
- `-r` - kopiowanie całego podkatalogu
- `-v` - verbose, przydatna, jeśli nie udaje nam się połączyć
- swój katalog domowy można zastąpić przez znak `~`
- nie podanie ścieżki spowoduje wgrywanie plików względem katalogu domowego
