if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

if [ -x "$(command -v brew)" ]; then
	HAS_BREW=1
fi

if [ -x "$(command -v apt-get)" ]; then
	HAS_APT=1
fi

if [ -x "$(command -v dnf)" ]; then
	HAS_DNF=1
fi

if [ -x "$(command -v yum)" ]; then
	HAS_YUM=1
fi
