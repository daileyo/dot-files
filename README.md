# dot-files

_formerly bashrc-include_

## Setup

1. Install [oh-my-zsh](https://ohmyz.sh/#install), if it isn't already.  It can be installed via curl.  Refer to the linked documentation for more installation details.

    ```shell
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
2. Install [Brew](https://docs.brew.sh/Installation), if it isn't already. It can be installed via curl.  Refer to the linked documentation for more installation details.

    ```shell
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
3. Fork and Clone this repository.

    [Fork](https://github.com/wwg-internal/devops-dot-files/fork) the repository before cloning, and select yourself as the owner.  This will allow for optionally committing and tracking changes to personal dotfiles without affecting the main project.
4. Install the brew bundle.
    
    Run brew bundle from within devops-dot-file project directory.
    ```shell
    brew bundle
    ```

5. Run the two init scripts in the devops-dot-files project.

    Scripts will need to have permissions modified so they can be ran.  The example commands below assume that they are being executed within the project directory.

    ```shell
    chmod +x init-dot-files.sh init-dot-dirs.sh
    ```
    To test out the scripts without overwriting existing dotfiles
    ```shell
    ./init-dot-files.sh -t; ./init-dot-dirs.sh -t
    ```
    To deploy the scripts to the home directory
    ```shell
    ./init-dot-files.sh -p; ./init-dot-dirs.sh -p
    ```
## Usage
Once the init scripts have been ran, the files can be interacted with normally.  The added bonus is that there is an option to track the changes to files within the project.  

### Windows
_TODO_

The Defaulted Globals include:

|Global Variable|Description|
|---|---|
|__DOT_FILE_EDITOR__|Defines the editor to be used in aliases referencing this value.  It is defaulted to VSCode, which is installed with the included BrewFile.  It can be updated to any editor of choice.
|__GIT_WORKSPACE__|Defines the directory where git repositories are cloned to on the local system.|

Here are some included aliases to help with interacting with the project setup itself:

|Alias|Description|
|---|---|
|edp|__EditDotfileProject__: _Opens the entire project in the configured DOT_FILE_EDITOR._|
|egc|__EditGitConfig__:  _Opens the gitconfig file in the configured DOT_FILE_EDITOR._|
|ezrc|__EditZshRC__:  _Opens the .zshrc file in the configured DOTE_FILE_EDITOR._|
|szrc|__SourceZshRC__:  _reloads zshrc in current session.  __NOTE__: This can be used to reload after any CRUD process to alias or globals as well_.|
