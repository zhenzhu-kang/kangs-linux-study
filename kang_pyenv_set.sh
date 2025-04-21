#!/bin/bash
# filepath: /root/codePrac/linuxPrac/kang_pyenv_set.sh

# pyenv 설치 for Debian
echo "Updating package list and installing dependencies..."

# 업데이트 및 필수 패키지 설치
apt update && apt upgrade -y
apt install -y curl make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git

#pyenv 설치
echo "Cloning pyenv repository..."
curl https://pyenv.run | bash

#환경변수 설정
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# 설정 적용
source ~/.bashrc

# 설치 확인
echo "Verifying pyenv installation..."
if command -v pyenv >/dev/null 2>&1; then
    echo "pyenv installed successfully!"
else
    echo "pyenv installation failed."
    exit 1
fi

# Python 3.12 설치
echo "Installing Python 3.12..."
pyenv install 3.12.0

# Python 3.12를 로컬 기본 버전으로 설정
echo "Setting Python 3.12 as the local version..."
pyenv local 3.12.0

# 설정 확인
echo "Verifying Python 3.12 installation..."
if pyenv version | grep -q "3.12.0"; then
    echo "Python 3.12 installed and set as local version successfully!"
    pyenv version
else
    echo "Failed to install or set Python 3.12."
    exit 1
fi
