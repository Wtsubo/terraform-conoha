# conoha
- TerratermにてConohaのクラウドにUbuntuのインスタンスを立ち上げるツール
- ConohaのVMは初期ユーザはrootでsshもできるように設定されるが、Cloudinitを使い、別のユーザを追加している。
- Ubuntu20.1では通常のデプロイではIPv6が開始されないので、Cloudinitのnetplanを利用できるように修正している。
- 使い方
  1. Terraformインストール
  2. デプロイするUbuntuの初期設定は./config/ubuntu-userdata.txtを編集して変更する。
  3. terraform初期化
     ```
     $ terraform init
     ```
  4. terraformデプロイ
     - ConohaのAPI利用を開始してusername, user_password, tenant_id, api_urlを取得する。
     - variableファイルに値を追加しても良いし、以下のようにterraformの引数に加えても良い。
     ```
     $ terraform apply \
      -var 'user_name=xxxx' \
      -var 'user_pass=xxxx' \
      -var 'tenant_id=xxxx' \
      -var 'api_identity_url=xxxx \'
      -var 'public_key_path=xxxx'
     ```
