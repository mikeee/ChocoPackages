# ![hcloud Logo](https://cdn.jsdelivr.net/gh/mikeee/ChocoPackages/icons/hcloud.png "hcloud Logo") [hcloud](https://chocolatey.org/packages/hcloud)

`hcloud` is a command-line interface for interacting with Hetzner Cloud.

## Getting Started

1. Visit the Hetzner Cloud Console at [console.hetzner.cloud](https://console.hetzner.cloud/),
    select your project, and create a new API token.
2. Configure the `hcloud` program to use your token:

``` bash
hcloud context create my-project
```

3. You’re ready to use the program. For example, to get a list of available server
    types, run:

``` bash
hcloud server-type list
```

See `hcloud help` for a list of commands.

**NOTE**: This package is automatically updated. If it is out of date and there is no newer package submitted, please use the `Contact Maintainers` functionality to alert me.
