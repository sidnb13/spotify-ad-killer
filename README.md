# spotify-ad-killer

A simple and legal way to circumvent Spotify ads on its desktop app. **MacOS only.**

## How it works

A executable shell script runs in an infinite loop. It runs an embedded AppleScript, which in the case Spotify is running, checks if the current track is less than 30 seconds in duration or the name of the track is in `blocklist.txt` If both of these conditions are true, the AppleScript quits Spotify and restarts it. It then skips to the next track to provide a seamless transition.

## Setup

Run the following commands on your `.bash_profile`, `.bashrc`, or `.zshrc` config file (examples below use `.zshrc`) and replace the variable value with your path to this folder. This also adds this folder to your
`$PATH` environment variable so the `spotikill` script can be executed from anywhere simply by typing `spotikill` in the terminal.

```sh
sudo echo "export SPOTIKILL_PATH=/absolute/path/to/folder" >> ~/.zshrc
echo "export PATH=\"$SPOTIKILL_PATH:$PATH\"" >> ~/.zshrc
```

Alternatively, you can append the export commands within quotations to the config file manually by opening it in a text editor with root permissions: `sudo editor_name ~/.zshrc`.

# CLI

The `adblock` executable CLI is invoked with the options `-l, -a, -k, -d` which correspond to list the blocklist of ads, add an ad's name to the blocklist, kill the `spotikill` process, and delete a ad's name from the blocklist.

## Running constantly in the background

You can make the daemon script run even without an active terminal window using the unix command `nohup`; it only stops when the computer is shut down:

```sh
nohup spotikill &
```

To terminate this process as an alternative to the `-k` in `adblock`, run the following command which gives an output:

```sh
pkill -f spotikill
```
