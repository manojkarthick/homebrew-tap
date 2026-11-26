# Homebrew

## Formulae
Invoke either of the following commands if the formula is hosted at GitHub

```sh
$ brew install manojkarthick/tap/<formula>
```

Or

```sh
$ brew tap manojkarthick/tap
$ brew install <formula>
```

Invoke the following command if the formula is *not* hosted at GitHub

```sh
brew tap manojkarthick/homebrew-tap 
brew install <formula>
```

## Casks
Invoke either of the following commands if the cask is hosted at GitHub

```sh
$ brew install --cask manojkarthick/tap/<cask>
```

Or

```sh
$ brew tap manojkarthick/tap
$ brew install --cask <cask>
```

Invoke the following command if the cask is *not* hosted at GitHub

```sh
brew tap manojkarthick/homebrew-tap 
brew install --cask <formula>
```

If you get a dialog stating the cask is broken try installing with `--no-quarantine`.

### Beta channels
Casks with a beta channel ship it as a separate `<cask>@beta` cask, for example `openusage@beta`. It gets every beta and every stable release. The two conflict, so to switch channels uninstall one before installing the other:

```sh
brew uninstall --cask openusage && brew install --cask manojkarthick/tap/openusage@beta
```

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
