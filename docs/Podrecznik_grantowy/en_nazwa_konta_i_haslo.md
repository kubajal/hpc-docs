
# Account and password

The account name and password are created upon [user registration](./en_zakladanie_konta.md) by the grant manager or upon [adding new users](./en_jak_wystapic_o_grant_obliczeniowy.md) to the grant. The password is sent automatically via e-mail to the address provided within the registration form.

- The account name consists of max. 8 characters. It is not the e-mail address given at the first registration, but the login created upon the second stage of registration.
- Note: the password generated within the firm is not yet active. Please use the password sent via e-mail.
- Grant manager should create the account (with the name being max. 8 characters long) and [add him/herself to the grant users](./en_jak_wystapic_o_grant_obliczeniowy.md).

In case of any difficulties obtaining the account's password - please [contact us](../kontakt.md).

## Accessing ICM

To use the ICM computational infrastructure, please log into the access node at `hpc.icm.edu.pl` via SSH using the created account name (do not use your e-mail address).

For more information on connecting – plase see examples for [MS Windows](../Tutorials/Logowanie/ssh_windows.md) and [UNIX/GNU/Linux](../Tutorials/Logowanie/ssh.md).

Submitting tasks to `hydra` and `topola` is possible directly from the `hpc.icm.edu.pl` access node. To submit tasks to other systems, it is necessary to log in further, e.g. `ssh okeanos` or `ssh rysy`.

## First login

At the first login the user will be asked to change his/her password - see below:

```.sh
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for user login_użytkownika

Enter login(LDAP) password:                 <----- wpisać hasło początkowe z maila
New password:                               <----- wpisać nowe hasło
Retype new password:                        <----- ponownie  wpisać nowe hasło
LDAP password information changed for username
```

- **Note**: the password you type won't appear on the screen due to security reasons; press `enter` when done.

- If the password sent by e-mail won't arrive upon registration, please check your `spam` folder. In case of other difficulties, please [contact us](../kontakt.md).

- The password can be changed via `passwd` command. Please note that it cannot be a palindrom, a string of consecutive keyboard characters, or similar to the previous password.
