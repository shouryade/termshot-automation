# TermShot Automation

I created this repository so that I didn't have to manually take screenshots of the terminal output for my Linux Commands assignment. I used [termshot](https://github.com/homeport/termshot) to capture the terminal output in the form of PNG files.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Introduction

TerminalShot Automation is designed to showcase the capabilities of termshot, a tool for capturing terminal output in the form of screenshots. The script executes a series of commands, including process termination commands, and uses termshot to visually represent the changes in the terminal.

## Features

- Demonstrates the use of various terminal commands.
- Captures terminal output using termshot for documentation and visualization.
- Simulates scenarios involving process termination.

## Requirements

- Bash
- Termshot
- Other dependencies as needed by the specific commands in the script

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/termshot-automation.git
   ```

2. Navigate to the project directory:

   ```bash
   cd termshot-automation
   ```

3. Ensure that termshot is installed. You can find termshot installation instructions at [termshot GitHub repository](https://github.com/npat-efault/termshot).

## Usage

Execute the script to run a series of commands and capture their output using termshot. Review the generated PNG files in the `tricky-output` directory to visually inspect the changes in the terminal.

```bash
./termshot-automation.sh
```
