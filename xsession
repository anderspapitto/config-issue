gpg-connect-agent /bye
export GPG_TTY=$(tty)

systemctl --user start compton
