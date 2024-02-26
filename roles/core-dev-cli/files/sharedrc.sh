
source $HOME/zsh-autocomplete/zsh-autocomplete.plugin.zsh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## start shell-assist
ALIAS_PATH="$HOME/shell-assist/alias"
if [ -d $ALIAS_PATH ]; then
for rc in $ALIAS_PATH/*.sh; do
    if [ -f $rc ]; then
    source $rc
    fi
done
fi
## end shell-assist

## start dotnet
export DOTNET_ROOT={{ dotnet_path }}
export PATH=$PATH:$DOTNET_ROOT
export PATH=$PATH:$DOTNET_ROOT/tools
export ASPNETCORE_Kestrel__Certificates__Default__Password=""
export ASPNETCORE_Kestrel__Certificates__Default__Path="$HOME/localhost.pfx"
## end dotnet

## Jetbrains start
export JETBRAINS="$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH=$PATH:$JETBRAINS
# Added by Toolbox App
export PATH="$PATH:/home/leanny/.local/share/JetBrains/Toolbox/scripts"
## Jetbrains end

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

## Sample usage => avd <name-of-emulator> | emulator -list-avds
function avd { cd "$(dirname "$(which emulator)")" && ./emulator -avd "$@"; }
