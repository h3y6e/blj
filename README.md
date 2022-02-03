# BLJ

Script for macOS to automate web authentication for the NAIST's campus wireless LAN, Mandara Musen LAN (`mm2010` or `mm2020`).

## Usage

0. Clone this repo.
```bash
git clone https://github.com/5ebec/blj
cd blj
```

1. Create a `.env` with `.env.sample` as a reference.
`UE_USERNAME` and `UE_PASSWORD` are the username and password for the Mandara System, respectively.
```txt:.env
UE_USERNAME=[your username]
UE_PASSWORD=[your password]
```

2. Prevent `Captive Network Assistant` from starting up.
```bash
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false
```

3. Change the path in line 10 of [`dev.5ebec.BackwardsLongJump.plist`](./dev.5ebec.BackwardsLongJump.plist) to your path.
```xml:dev.5ebec.BackwardsLongJump.plist
<string><!-- /your/path/to/autologin_mmlan.sh --></string>
```

4. Create a symbolic link to the plist file in `~/Library/LaunchAgents`.
```bash
cd ~/Library/LaunchAgents
ln -s [your/path/to/dev.5ebec.BackwardsLongJump.plist]
```

5. Load the plist file.
```bash
launchctl unload ~/Library/LaunchAgents/dev.5ebec.BackwardsLongJump.plist
launchctl load ~/Library/LaunchAgents/dev.5ebec.BackwardsLongJump.plist
```

## LICENSE
[MIT](./LICENSE)
