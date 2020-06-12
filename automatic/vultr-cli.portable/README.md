# ![vultr-cli Logo](https://cdn.jsdelivr.net/gh/mikeee/ChocoPackages/icons/vultr-cli.png "vultr-cli Portable Logo") [vultr-cli.portable](https://chocolatey.org/packages/vultr-cli.portable)

`vultr-cli` is a command-line interface for interfacing with the Vultr platform.

## Getting Started

Authentication
In order to use vultr-cli you will need to export your Vultr API KEY

``` bash
$env:VULTR_API_KEY = 'your_api_key'
```

See `vultr-cli help` for a list of up-to-date commands.

``` bash
vultr-cli is a command line interface for the Vultr API

Usage:
  vultr-cli [command]

Available Commands:
  account        Retrieve information about your account
  api-key        retrieve information about the current API key
  apps           Display all available applications
  backups        display all available backups
  bare-metal     bare-metal is used to access bare metal server commands
  block-storage  block storage commands
  dns            dns is used to access dns commands
  firewall       firewall is used to access firewall commands
  help           Help about any command
  iso            iso is used to access iso commands
  network        network interacts with network actions
  object-storage object storage commands
  os             grab all available operating systems
  plans          get information about Vultr plans
  regions        get regions
  reserved-ip    reserved-ip lets you interact with reserved-ip
  script         startup script commands
  server         commands to interact with servers on vultr
  snapshot       snapshot commands
  ssh-key        ssh-key commands
  user           user commands
  version        Display current version of Vultr-cli

Flags:
      --config string   config file (default is $HOME/.vultr-cli.yaml)
  -h, --help            help for vultr-cli
  -t, --toggle          Help message for toggle

Use "vultr-cli [command] --help" for more information about a command.
```

**NOTE**: This package is automatically updated. If it is out of date and there is no newer package submitted, please use the `Contact Maintainers` functionality to alert me.
