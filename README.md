<h1 align="center">
  <br>
  <a ><img src="https://github.com/Wint0x/rubysysmon/blob/main/logo.png" alt="Rubysysmon" width="350"></a>
  <br>
  Rubysysmon
  <br>
</h1>

<h4 align="center">A lightweight program designed for monitoring various aspects of the linux operating system built with <a href="https://www.ruby-lang.org" target="_blank">Ruby</a>.</h4>

## Features

- Disk Information
- Process Monitoring
- Network Monitoring
- System Health Overview (Uptime, load averages, etc)

## Installation

Install the program

```bash
# Clone this repository
$ git clone https://github.com/Wint0x/rubysysmon.git

# Go into the repository
$ cd rubysysmon

# Install bundler
$ sudo apt install ruby-bundler -y

# Install the required gems with Bundler
$ bundler install

# Run the program
$ ruby rubysysmon.rb
```
    
## Usage/Examples

```bash
    -a, --all                        Show everything
    -m, --machine                    Display hardware information
    -u, --user                       Display user information
    -d, --disk                       Display disk information
    -p, --process                    Display process information
    -n, --net                        Display network information
    -h, --help                       Show this message

```

## Technologies

This software uses the following open source packages:

- [Ruby](https://www.ruby-lang.org)
- [sys-proctable](https://github.com/djberg96/sys-proctable)
- [awesome_print](https://github.com/awesome-print/awesome_print)
- [sys-filesystem](https://github.com/djberg96/sys-filesystem)
- [free_disk_space](https://github.com/pr0d1r2/free_disk_space)

## Contributing

Contributions are always welcome!

See `CONTRIBUTING.md` for ways to get started.

## License

[MIT](https://choosealicense.com/licenses/mit/)
