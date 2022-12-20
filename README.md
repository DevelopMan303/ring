# Ring
## _Ring the alarm_
ring is a simple console based alarm clock. It can be run from the shell, but also from the git-bash which comes with the git installation. So it can run on nearly any system that has git installed.
## Usage:
```sh
ring [minutes to alarm] [alarm type]
```
e.g. alarm after 1 minute:
```sh
ring 1
```
Since the system signal tone is different on every system different signal forms are supported for [alarm type]:
```sh
[alarm type] = 0 : Default: All alarm types are used
[alarm type] = 1 : Uses terminal beep.
[alarm type] = 2 : 2 Usage of speech-dispatcher “spd-say”
[alarm type] = 3 : Visual output
```

## Install
Clone it at any location you like:
```sh
git clone https://github.com/DevelopMan303/ring.git
```
Afterwards copy it to a bin directory:
```sh
mkdir -p ~/bin ; cd ring ; cp ring.sh ~/bin/ring
```
You may logout/login afterwards.
## License
Do with this whatever you like.

## Last words
It is a little surprising how much overhead for error handling, documentation and platfor support is required where the busyness logic could be as simple as this:
```sh
sleep 1m; echo -en "\007"
```
