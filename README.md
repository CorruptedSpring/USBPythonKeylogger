# USB Python Keylogger

A simple, portable keylogger implementation in Python that can be run from a USB drive. This project is intended for educational purposes only.

## Features

- Runs silently in the background
- Automatic Python installation if not present
- Records all keystrokes with timestamps
- Saves logs to text files
- Portable - can run from USB drive
- Automatic package installation

## Requirements

- Windows OS
- Internet connection (only for initial setup if Python is not installed)
- USB drive (optional)

## Setup

1. Copy all files to your desired location (USB drive or local folder)
2. Files included:
   - `run.bat` - Main launcher script
   - `Keylogger.py` - Core keylogger implementation
   - `backgroundStart.vbs` - Silent background launcher
   - `README.md` - This documentation

## Usage

### Normal Start
Double-click `run.bat` to start the keylogger. This will show a console window.

### Silent Start
Double-click `backgroundStart.vbs` to start the keylogger silently in the background.

### Log Files
Logs are saved in the same directory with the format:
`keylog-[start-datetime]_[end-datetime].txt`

## Important Notice

This tool is created for educational purposes only. Using a keylogger without explicit permission from the owner of the computer system may be illegal. The creator assumes no liability for misuse of this software.

## Technical Details

- Written in Python 3.8+
- Uses the `keyboard` library for keystroke capture
- Implements automatic Python installation if needed
- Creates timestamped log files
- Runs with minimal system footprint

## Disclaimer

This software is provided for educational purposes only. Any use of this software for malicious purposes is strictly prohibited. Users are responsible for ensuring they comply with all applicable laws and regulations.