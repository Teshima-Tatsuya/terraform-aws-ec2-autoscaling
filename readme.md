## 概要
Terraform Cloudを利用して、AWS EC2 AutoScaling環境を構築する構成  
ACMを利用して、HTTPS通信をしているため、事前にドメイン取得が必要です。

## 利用前提
1. Terraform Cloudのアカウントが開設済みであること  
（backend.tfを修正することでローカルでの実行も可能なはずです。）
1. HTTPSアクセスを行うための独自ドメインを取得していること。  
（独自ドメインを利用しない場合は、ACM、Route53省略し、直接ALBのDNSでアクセスしてください）
1. backend.tfを自分の環境に修正すること

## 構成
構成は以下の通り
![構成](https://raw.githubusercontent.com/Teshima-Tatsuya/terraform-aws-ec2-autoscaling/583e45670bb69433fbf797ec0e76d6bc48ad2aaf/EC2AutoScaling.jpg)


## 利用方法
本リポジトリをclone（または、folk）し、前提条件の作業を実施後、Terraform Cloudから実行

## モジュールの説明
本リポジトリではTerraform Moduleを利用した構成を取っている。
それぞれ以下の通り

- domain  
Route53, ACMの設定を行っている。  
利用するドメインは私のドメインを利用しているため、適宜修正されたし。

- elb  
ALBの設定を行っている。  
Route53からALBへのレコード設定もここで行っている。

- iam  
インスタンスの起動に必要なIAMロールの設定等を行っている。

- vpc  
以下の設定を行っている。
  - インスタンス起動に必要なVPC構成
  - Session Manager接続に必要なVPCエンドポイントの設定
  - インスタンスから外部に通信するためのNATGatewayの設定

- web-server  
以下の設定を行っている。  
  - オートスケーリング設定
  - user-dataの設定として、Apache、CloudWatch Agentのインストール
