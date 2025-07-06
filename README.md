# BadUSB Educational PowerShell Demo

**Author:** [Rob2209](https://github.com/Rob2209)

---

## Contents

* [What Is This?](#what-is-this)
* [How It Works](#how-it-works)
* [Requirements](#requirements)
* [Usage](#usage)
* [Example Output](#example-output)
* [Customization](#customization)
* [Sources & References](#sources--references)
* [Acknowledgments](#acknowledgments)
* [License](#license)

---

## What Is This?

This repository demonstrates how a USB device (e.g. DigiSpark ATtiny85 or Rubber Ducky BadUSB) can inject a PowerShell payload into Windows to collect **basic system info** (user, SID, Microsoft account, geolocation via IP, etc.) and display a live map.
The goal: **Raise awareness of BadUSB-style threats.**

---

## Disclaimer

> **This project is provided strictly for educational, research, and security awareness purposes.**
> Do **not** deploy or use these techniques on any device or network you do not own or have explicit, legal authorization to test.
> Unauthorized use may be illegal and unethical.

---

## How It Works

1. **Hardware:**
   DigiSpark ATtiny85 or compatible USB HID device, flashed with the included Arduino sketch.

2. **Payload:**
   Device opens Windows Run (`Win+R`) and types a PowerShell command to fetch and run [`displayInfo.ps1`](displayInfo.ps1) from this repo:
   [https://raw.githubusercontent.com/Rob2209/RubberDuckyExample/main/displayInfo.ps1](https://raw.githubusercontent.com/Rob2209/RubberDuckyExample/main/displayInfo.ps1)

3. **Script Actions:**

   * Displays user/computer info, SID
   * Checks for Microsoft Account and displays details if found
   * Shows IP-based geolocation (via [ip-api.com](http://ip-api.com))
   * Opens OpenStreetMap at the estimated location
   * Warns the user about USB security

---

## Requirements

* **Hardware:** DigiSpark ATtiny85, Rubber Ducky, or any compatible BadUSB device
* **Software:**

  * [Arduino IDE](https://www.arduino.cc/en/software) (for flashing DigiSpark)
  * [PowerShell](https://learn.microsoft.com/en-us/powershell/) (comes with Windows)
* **Web APIs:**

  * [ip-api.com](http://ip-api.com) (for IP geolocation)
  * [OpenStreetMap](https://www.openstreetmap.org/) (for map display)
* **Registry access:** For Microsoft Account info (script uses PowerShell registry reads)

---

## Usage

1. **Flash the device:**
   Use the Arduino IDE and DigiKeyboard library to upload the provided Arduino sketch.

2. **Plug the device into a Windows PC:**
   The device acts as a keyboard, opens Run, and injects the payload.

3. **Observe:**
   The PowerShell script runs, displays info, opens a map, and warns the user.

4. **Review output and security warning:**
   All actions are transparent and non-destructive.

---

## Example Output

```
----------------------------
   PowerShell BadUSB Demo
----------------------------
Date/Time: 2024-07-05 19:02:17
User Name    : rob
Profile Path : C:\Users\rob
SID          : S-1-5-21-XXXXXXXXXX...
Microsoft Account Email: rob@example.com
Microsoft Account Display Name: Rob Example

------------------------
IP-based Location Info:
------------------------
Public IP    : 203.0.113.20
Country      : Germany
Region       : Bavaria
City         : Munich
ZIP          : 80331
ISP          : Example ISP
Lat/Lon      : 48.137, 11.575

Opening OpenStreetMap at IP-based location (48.137, 11.575)...

This code was executed on your machine via a USB device using a single line in PowerShell.

******************************
*  SECURITY WARNING:         *
*  Never trust unknown USB   *
*  devices!                  *
******************************
Press Enter to exit
```

---

## Customization

* **Edit [`displayInfo.ps1`](displayInfo.ps1)** to add/remove info, change map provider, or customize warnings.
* **Modify the Arduino sketch** to change delays, add keystrokes, or adjust the payload for different environments.

---

## Sources & References

**Hardware/Software**

* [Arduino IDE](https://www.arduino.cc/en/software)
* [DigiKeyboard Library](https://github.com/digistump/DigistumpArduino)
* [PowerShell Documentation](https://learn.microsoft.com/en-us/powershell/)

**Web Services and APIs**

* [ip-api.com - Free IP Geolocation API](http://ip-api.com/)
* [OpenStreetMap](https://www.openstreetmap.org/)

---

## Acknowledgments

* Parts of this repository (PowerShell scripting, Arduino sketch tuning, and documentation) were developed in collaboration with [OpenAI ChatGPT](https://openai.com/chatgpt) as an AI assistant.

---

## License

This project is released under the MIT License.
**Use responsibly and ethically.**
