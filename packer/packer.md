# Packer

[Packer](https://github.com/hashicorp/packer) is a tool for building identical machine images for multiple platforms from a single source configuration.

Packer is lightweight, runs on every major operating system, and is highly performant, creating machine images for multiple platforms in parallel. Packer comes out of the box with support for many platforms, the full list of which can be found at https://www.packer.io/docs/builders.

Support for other platforms can be added via plugins.

The images that Packer creates can easily be turned into Vagrant boxes.

## Installation

```shell
# Add HashiCorp GPG
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add HashiCorp repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install
sudo apt-get update && sudo apt-get install packer
```

## Sections

In a Packer definition file there are different sections, each one with a specific role.

- `packer{}` - Configure Packer to use one or more plugins (*builders*)
- `source{}` - Configure the specific builder
- `build{}` - Define what Packer should do once the image object is running
- `build.provisioner{}` - Specify actions/commands to run

## Commands

List of useful commands:

- `init .` - Initialize the configuration (download plugins, etc.)
- `fmt .` - Format the template to keep the code style consistent
- `validate .` - Validate the template
- `build .` - Run the configuration

## Examples

1. The `docker.pkr.hcl` is a very simple example on how to build a Docker image based on a preexistent public image of Ubuntu.
