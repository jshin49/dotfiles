# dotfiles

Dotfile configurations for Ubuntu, many parts inspired and taken from [J-Min's repo](https://github.com/j-min/dotfiles)

## Install
```
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/jshin49/dotfiles.git $HOME/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
rm .bash_profile .zshrc
dot checkout

bash .install.sh
```

If failed at Oh-my-zsh change shell, just run ```bash .install.sh``` agian


## Python Dev env 

Set up the following on the GPU servers. You can do the same for your mac for local development, but we mainly work on server using VSCode and SSH extension.

### 0. Server-side Dev tools on Mac

Since we all use Macs for development, but the actual working environment is on the GPU servers, please use **VS Code** for consistency**.**

**Installing VS Code Extensions**

We use the "Remote - SSH" extension created by Microsoft to easily edit the code on the Server and run it seamlessly.

**Basic dotfiles**

You can also refer to the basic dotfiles and their installations at the following repo:

[https://github.com/jshin49/dotfiles](https://github.com/jshin49/dotfiles)

### 1. Python Development Environment

Basically, we want to use `pipenv` along with `pyenv` to manage the package and version dependencies.

**Setting up [pyenv](https://github.com/pyenv/pyenv)**

Follow this instruction (or the latest upates on the above link)

To install, for Mac you can use Homebrew as in the github repo.

For the GPU server, 

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
exec "$SHELL"
# Install python dev dependencies
sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

**Setting up [pipenv](https://github.com/pypa/pipenv)**

Given that you have installed the above `pyenv`, let's do the following to install `pipenv`

```bash
# Install python with pyenv
pyenv install x.y.z # python version e.g.) 3.7.5
pyenv global x.y.z # set global python version
pip install pipenv
```

After this is set up, once you clone your repository in your local or GPU dev machine, you can simply run the following and everything will be set:

```bash
pipenv install --dev
```

This library will then automatically set up a ***virtual environemnt*** with the Python version and packages installed as defined in the `Pipfile`.

Hence, the usage will be,

```bash
pipenv shell
```

and this will activate a virtual environment that was just created.

To exit this environment and return to your normal shell, simply type `exit` in the shell.

Finally, and most importantly, in order to install a pip package, you must do it as 

```bash
pipenv install <PACKAGE>       # packages
pipenv install <PACKAGE> --dev # dev-pacakges
```

otherwise, the installed package will not be recorded in the `Pipfile`.

To clean packages not in pipenv `Pipfile.lock` (which is generated after calling pipenv install),

```bash
pipenv clean
```

### 2. Style Guide

We will use [PEP8](https://www.python.org/dev/peps/pep-0008/), but keep in mind [A Foolish Consistency is the Hobgoblin of Little Minds](https://www.python.org/dev/peps/pep-0008/#id15)!

[Yapf](https://github.com/google/yapf) is a useful tool for auto-formatting code to adhere to PEP8. 

> Autoformatter (Black) + minimal Pylint (Google)

We adopted the following style guide

- Please read [Google Python Style Guide](http://google.github.io/styleguide/pyguide.html)
    - in addition to this,
        - write all Tensor input/output shapes as comments
- We use the pylintrc file based [Google's Seq2seq repo](https://github.com/google/seq2seq/blob/master/pylintrc)

### 3. Basic Git workflow

We adopt the [Github Flow](https://guides.github.com/introduction/flow/) work flow into our project and hope that this lasts. 

Once all of the above Python Development Environment has been set up, 

1. The first thing to do is to clone the repo with your ssh key. If you encounter any problems with that, please refer to this [document](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).
2. Once you clone the repository, run the following lines of code to set up your local virtual environment.

```bash
pipenv install --dev # installs all necessary dependencies
pipenv shell # changes your shell to the local virtaul environment just set up
pre-commit install # installs the pre-commit hook
```

### 4. How to make a proper commit

Once we have everything set-up (including the pre-commit hook), making changes and committing them will require a pre-commit check as mentioned in the above Section 2 Styleguide. The steps are as follows:

1. You make a change in your code, let's say `example.py`
2. You stage your changes by calling `git add example.py`
3. You will write a commit with a descriptive commit message as such:
`git commit -m '[AVM3-10] added new test logic'`
4. The `pre-commit` hook will be automatically invoked and run the following checks:
    1. Check and show diffs with `black`
    2. Run `black` to auto-format your code
    3. Lint the code with `pylint`
5. If your code passes all checks, then your commit is done. ***However***, if any of the checks fails (4.1, 4.3, or 4.5), then none of the auto-formatted changes will be staged. So you will have to add your changes to `[example.py](http://example.py)` accordingly and then re-stage this file with
`git add example.py` again until all checks pass.
6. Once everything is finished, you can push your commits.
