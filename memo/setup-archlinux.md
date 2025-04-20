## Arch Linuxのインストール手順

## キーボードレイアウト
日本語キーボードの場合に設定する(英字キーボードは不要)
```bash
loadkeys jp106
```

## 起動モードの確認
本手順はUEFIの使用が前提
```bash
ls /sys/firmware/efi
```

## パーティションの作成
ここでは以下のパーティション構成とする
|パーティション |サイズ   |フォーマット |マウントポイント |
|--------------:|--------:|------------:|----------------:|
|/dev/nvme0n1p1 |1G      :|FAT32       :|/boot            |
|/dev/nvme0n1p2 |残り全部:|btrfs       :|/                |
- ディスクの初期化
```bash
sgdisk -z /dev/sda
```
- /boot用パーティションの作成
```bash
sgdisk -n 1:0:+1G -t 1:ef00 -c 1:"EFI System" /dev/nvme0n1
```
- /用パーティションの作成
```bash
sgdisk -n 2:0: -t 2:8300 -c 2:"ARCH ROOT" /dev/nvme0n1
```

## パーティションのフォーマット
```bash
mkfs.vfat -F32 /dev/nvme0n1p1
mkfs.btrfs /dev/nvme0n1p2
```

## 無線LAN接続(有線LANの場合は不要)
- 利用可能な無線インターフェースリストを取得する
```bash
iwctl device list
```
```bash
(出力例)                            Devices
--------------------------------------------------------------------------------
  Name                Address             Powered   Adapter   Mode
--------------------------------------------------------------------------------
  wlan0               xx:xx:xx:xx:xx:xx   on        phy0      station
```

- 利用可能な無線ネットワークのスキャン
```bash
iwctl station wlan0 scan
```

- スキャンした無線ネットワークの出力
```bash
iwctl station wlan0 get-networks
```
```bash
(出力例)                      Available networks
--------------------------------------------------------------------------------
  Network name                    Security          Signal
--------------------------------------------------------------------------------
  valinor                         psk               ****
  arda                            psk               ****
```

- 無線ネットワークに接続
```bash
iwctl station wlan0 connect arda --passphrase mysupersecretpassphrase
```

- 接続した無線ネットワークの情報確認
```bash
iwctl station wlan0 show
```

## ArchLinuxのインストール
- ネットワークの疎通確認
インターネットに接続できることを確認する
```bash
ping archlinux.org
```

- リポジトリの選択
日本のリポジトリを有線するために`/etc/pacman.d/mirrorlist`に以下の文を上に追記する
```bash
Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch
```

- パッケージのインストール
```bash
pacstrap /mnt base base-devel linux linux-headers linux-firmware dosfstools vim wpa_supplicant networkmanager dialog
```

- fstabの作成
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

- chroot
`arch-chroot`コマンドでrootの作業場所を変更する
```bash
arch-chroot /mnt
```

- Localeの設定
`/etc/locale.gen`をvimで開き、`en_US.UTF-8 UTF-8`と`ja_JP.UTF-8 UTF-8`の行のコメントを解除し、`locale-gen`コマンドを実行する
```bash
...
en_US.UTF-8 UTF-8
...
ja_JP.UTF-8 UTF-8
...
```
```bash
locale-gen
```
LANG環境変数を設定するため、`/etc/locale.conf`を作成し、以下の値を入力する
```bash
echo "LANG=en_US.UTF-8 UTF-8" > /etc/locale.conf
```
【英字キーボードの場合不要】日本語キーボードを利用する場合は以下の値を`/etc/vconsole.conf`に記載する
```bash
echo "KEYMAP=jp106" > /etc/vconsole.conf
```
