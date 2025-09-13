# kikuri_cluster

## 構築

### ArgoCDのセットアップ

#### Helm CLIのインストール

#### カスタマイズされたArgoCDのインストール

```bash
helm install -n argocd argocd kikuri/kikuri
```

- ノードの `http://localhost:30080` にアクセスするとArgoCDのWebUIが閲覧できる

- 自動でルートのApp of Appsである `/argocd/apps` のレポジトリが登録される

#### 初期パスワードを確認する

ArgoCD WebUIにアクセスするための初期パスワードを確認する。（ユーザー名は `admin` である。）

```bash
kubectl get secret/argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d; echo
```