# TermSnap

Imagine taking multiple screenshots of your terminal output for your assignment. Sounds tedious, doesn't it? Well, it is.

![Well, I am a firm believer of this thought!](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBzUn1_rTjBXPDd6N3Y5gA7kCwor_RmVckEYvJbEb8g31XFMSfPstGXxX0eRONul-5jeU&usqp=CAU "Automation is the key to success!")

I created this repository so that I didn't have to manually take screenshots of the terminal output for my Linux Commands assignment. I used [termshot](https://github.com/homeport/termshot) to capture the terminal output in the form of PNG files.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)

## Introduction

What it does is basically capturing terminal output in the form of screenshots. The scripts execute a series of commands, including process termination commands, and uses termshot to visually represent the changes in the terminal. The scripts are in 3 files namely:

- `general.sh` : For general commands that require no human interaction.
- `priviliged.sh`: For commands that require root privileges.
- `tricky.sh`: Process creation and termination commands including `kill`, `killall` and `pkill`.

## Features

- If you don't have a Linux machine, you can just use the `termshot-actions` branch of this repository to run the script on GitHub Actions and download the generated PNG files.
- Ez to use.

## Requirements

- Bash
- `termshot` : Download it from [here](https://github.com/homeport/termshot/releases/tag/v0.2.7)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/shouryade/termshot-automation.git
   ```

2. Navigate to the project directory:

   ```bash
   cd termshot-automation
   ```

3. Ensure that `termshot` is installed. You can find termshot binaries to download for your machine at [termshot GitHub repository](https://github.com/homeport/termshot/releases/tag/v0.2.7).

## Usage

### Usage on your Linux machine

Execute the scripts using the following commands:

```bash
chmod +x general.sh
./general.sh
chmod +x priviliged.sh
sudo ./priviliged.sh
chmod +x tricky.sh
./tricky.sh
```

### Usage on GitHub Actions

Fork this repository.  
Change the branch to `termshot-actions` and follow the steps below:

- Commit some change in the README.md file and push it to the repository.
- This will trigger the workflow and you can download the generated PNG files from the artifacts section of the workflow.

Congratulations! You have successfully automated the process of taking screenshots of your terminal output!
note: The workflow doesn't run for `tricky.sh` file. If you can fix it, please create a pull request.

## Contributing

Feel free to contribute to this repository. You can create an issue or a pull request. I will be happy to review your changes.
Currently Github Actions is not able to run the `tricky.sh` file. If you can fix it, please create a pull request.
