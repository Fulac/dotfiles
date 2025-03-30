## kubernetesの構築メモ

#### 前提条件
1. 利用OS：Fedora41
2. シェル：zsh (or bash)

#### 参考
[Fedora公式ドキュメント](https://docs.fedoraproject.org/en-US/quick-docs/using-kubernetes-kubeadm/)

#### kubernetesのインストール（マスターノード）
1. パッケージの最新化
```bash
sudo dnf upgrade
```

2. スワップメモリの無効化
```bash
sudo dnf remove zram-generator-defaults
sudo reboot now
```

3. ファイアウォールの無効化
```bash
sudo systemctl disable --now firewalld
```

4. iptables, iproute-tcのインストール
```bash
sudo dnf install iptables iproute-tc
```

5. カーネルモジュール(overlay, br_netfilter)の起動時自動読み込み設定
```bash
sudo cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
```

6. カーネルモジュール(overlay, br_netfilter)の有効化
```bash
sudo modprobe overlay
sudo modprobe br_netfilter
```

7. カーネルパラメータの永続設定
```bash
sudo cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
```

8. システム設定(カーネルパラメータ)の再読込
```bash
sudo sysctl --system
```

9. overlay, br_netfileterが正常に読み込めていることを確認
  overlay, br_netfilterが表示さればOK
```bash
lsmod | grep br_netfilter
lsmod | grep overlay
```

10. ネットワークモジュールのパラメータ値確認
  値が'1'であることを確認する
```bash
sysctl net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward
```

11. コンテナランタイムのインストール
  cri-oを利用する
```bash
sudo dnf install cri-o containernetworking-plugins
```

12. kubernetesのインストール
```bash
sudo dnf install kubernetes kubernetes-kubeadm kubernetes-client
```

13. cri-oの起動
```bash
sudo systemctl enable --now crio
```

14. kubernetesで利用するイメージのダウンロード
```bash
sudo kubeadm config images pull
```

15. kubeletの起動
```bash
sudo systemctl enable --now kubelet
```

16. kubernetesクラスタの初期化
```bash
sudo kubeadm init --skip-phases=addon/kube-proxy
```

17. kubernetesクラスタ操作権限をユーザに追加
```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
