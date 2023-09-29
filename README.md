# Oracle Cloud Hangout Cafe Season7 #5 Cluster API

## Directory Configuration

```sh
.
├── README.md
├── autoscaler
│   ├── scale.yaml
│   └── workload
│       └── nginx.yaml
└── clusterapi
    ├── kubeadm.yaml
    ├── ocne.yaml
    └── oke.yaml
```

## Management Clusterの構築

### OKEのプロビジョニング

OKEのプロビジョニングについては、[こちら](https://oracle-japan.github.io/ocitutorials/cloud-native/oke-for-commons/)の手順をベースに実施してください。
ただし、Worker Nodeのスペックを以下に設定してください。

- Node数: 3
- OCPU: 2
- Memory: 8

### clusterctlのインストール

ここではv1.5.2をインストールします。

```sh
curl -L https://github.com/kubernetes-sigs/cluster-api/releases/download/v1.5.2/clusterctl-linux-amd64 -o clusterctl
```

実行権限とパスを変更します。

```sh
sudo install -o root -g root -m 0755 clusterctl /usr/local/bin/clusterctl
```

これでインストールは完了です。

以下のコマンドが実行できればOKです。

```sh
$ clusterctl version
clusterctl version: &version.Info{Major:"1", Minor:"5", GitVersion:"v1.5.2", GitCommit:"3290c5a28ed28c1909713e59e5d481a3e8f68a90", GitTreeState:"clean", BuildDate:"2023-09-26T15:50:41Z", GoVersion:"go1.20.8", Compiler:"gc", Platform:"linux/amd64"}
```

### Cluster APIのインストール

Cluster APIをインストールします。

今回は、OCI上でのKubeadmを利用したクラスタ、OKEクラスタ、Oracle Cloud Native Environmentクラスタを構築するため、KubeadmのControl Plane APIおよびBootstrap API、Cluster API for OCI、Cluster API for OCNEをインストールします。

```sh
clusterctl init --infrastructure oci --bootstrap ocne --control-plane ocne --bootstrap kubeadm  --control-plane kubeadm
```

これでManagement Clusterの構築は完了です。

## Workload Clusterの構築

### Cluster APIで利用する環境変数の設定

ここでは、この後で利用する環境変数を設定していきます。

```sh

```

### k8s with Kubeadm on OCI Compute環境の構築

まずは、OCI Compute上にKubeadmを利用したクラスタを構築します。  

以下のコマンドを実行だけで構築できます。

```sh
clusterctl generate cluster oke-cluster --from ochacafe-cluster-api/clusterapi/oke.yaml |kubectl apply -f -
```




