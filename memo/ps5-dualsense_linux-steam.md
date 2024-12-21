#linux steamでps5コントローラーを認識させるための設定

### udev.rulesの作成
下記ファイルを作成する。
/etc/udev/rules.d/70-dualsensectl.rules

```
# PS5 DualSense controller over USB hidraw
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", TAG+="uaccess"

# PS5 DualSense controller over bluetooth hidraw
KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0660", TAG+="uaccess"

# PS5 DualSense Edge controller over USB hidraw
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0df2", MODE="0660", TAG+="uaccess"

# PS5 DualSense Edge controller over bluetooth hidraw
KERNEL=="hidraw*", KERNELS=="*054C:0DF2*", MODE="0660", TAG+="uaccess"
```
