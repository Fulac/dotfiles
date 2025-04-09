## polkitの許可設定メモ

### アクション
- NetworkManager
```bash
org.freedesktop.NetworkManager.policy
```

---
### 許可ルール
Arch Linuxの場合、ローカル設定は`/etc/polkit-1/rules.d`に記載する.  
関数は追加された順番に処理されるため、他のルールより先に処理される許可ルールを追加するには、
名前順で他ルールよりも前に来るファイル名を付ける（例：`00-early-checks.rules`）

- NetworkManager許可設定
```bash
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.NetworkManager.policy") {
        return polkit.Result.YES;
    }
});
```

- 特定のユーザに`org.freedesktop.timedate1.set-timezone`アクションの使用を許可する
```bash
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.timedate1.set-timezone" &&
        subject.user == "<USERNAME>") {
        return polkit.Result.YES;
    }
});
```

