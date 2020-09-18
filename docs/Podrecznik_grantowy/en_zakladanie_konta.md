### User registration

A user account is created upon registration within the grant system at
<https://granty.icm.edu.pl/>.

1.  Choose the **Zarejestruj się** tab and fill in the form
    [Rejestracja
    użytkownika](./images/Rejestracja_uzytkownika_v1.jpg):

    - Choose your institution - If not listed, please add it manually
    to the database with **Dodaj instytucję/jednostkę**. It takes two
    steps: (1) add main institution (e.g. University of Warsaw), (2)
    add the unit within the main institution (i.e. faculty/department
    etc.). Then choose the added instituion and unit with **dodaj
    jednostkę do instytucji**.


    - Phone number/Telefon - your phone number.

    - Login - to log in for the first time, please use your e-mail address.

    - The password will be e-mailed to you immediately upon completing the registration.

    ***Note: If you won't receive the password within 15 minutes, please
       check your SPAM folder. Registration in the grant system IS NOT equivalent to opening of
       the ICM account.***

2.  After receiving the password, please log in to the grant system
with your e-mail address as login.

3.  Create a new grant according to [Jak przygotować
    wniosek o grant
    obliczeniowy](./en_jak_wystapic_o_grant_obliczeniowy.md)

    - To open the ICM account, it is necessary to have an active
      computational grant.
      
4.  In the tab **Uzyskaj konto ICM (zostań realizatorem grantu)**, choose the grant ID and propose your **login**. It will be used for:
      - logging into the grant system,
      - logging into the ICM machines,
      - as your [e-mail address](./en_poczta_elektroniczna.md).
	
    Login should:
    	  - be max. 8 characters long,
	  - contain lowercase (latin) letters or numbers only (the first character must me a letter),
	  - not contain any of the special characters: `,._\!?`.

    It is suggested that login names are derived from the real
    last/first name (e.g. jsmith).

### Account activation

The account is activated upon grant activation, see. [uruchomieniem grantu
obliczeniowego](./en_jak_wystapic_o_grant_obliczeniowy.md)

### Useful commands

After [logging into the machine](./en_nazwa_konta_i_haslo.md), the user
mat look up the basic information on the account:

  - `finger` - user information lookup program,
  - `id` - print real and effective user and group IDs,
  - `groups` - print the groups a user is in,
  - `limit` - show limits imposed on the user processes,
  - `getent group | grep <grant-ID>` - information on all users with access to the group/grant,
  - `ls` - list directory contents.