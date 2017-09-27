# es_extended
FXServer ES Extended

[DISCORD]

https://discord.me/fivem_esx

[SCREENSHOT]

![screenshot](http://i.imgur.com/aPFdJl3.jpg)

[DESCRIPTION]

Add support for accounts (bank / black money) you can also add others accounts

Add support for inventory (press F2 ingame) => Players can now remove items from inventory

Add support for jobs

Loadouts are saved in database and restored on spawn

Positions are saved in database and restored on spawn

[REQUIREMENTS]

- essentialmode + es_admin => https://forum.fivem.net/t/release-essentialmode-base/3665
- esplugin_mysql => https://forum.fivem.net/t/release-essentialmode-base/3665/1181

[INSTALLATION]

1) Using fvm
```
fvm install --save --folder=essential ESX-Org/es_extended
fvm install --save --folder=esx ESX-Org/esx_menu-default
fvm install --save --folder=esx ESX-Org/esx_menu-dialog
fvm install --save --folder=esx ESX-Org/esx_menu-list

```

2) Manually
```
- Download https://github.com/ESX-Org/es_extended/releases/latest
- Put it in [essential] directory
- Download https://github.com/ESX-Org/esx_menu-default/releases/latest
- Put it in [esx] directory
- Download https://github.com/ESX-Org/esx_menu-dialog/releases/latest
- Put it in [esx] directory
- Download https://github.com/ESX-Org/esx_menu-list/releases/latest
- Put it in [esx] directory
```

1) Import es_extended.sql in your database
2) Add this in your server.cfg :

```
start es_extended

start esx_menu-default
start esx_menu-list
start esx_menu-dialog
```

