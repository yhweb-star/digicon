# digicon 「デジコン」

## 教育機関や保育施設と保護者との情報共有のためのアプリケーション
## 電話や書類などアナログではなく、アプリ（digital・デジタル）で連絡（contact・コンタクト）し合える

https://gyazo.com/98c04983897920bcd3ba9dd1f643c2c9

# 概要

## お子様に関する情報は正確に伝えたい ＆ 把握したい。でも、忙しい時間帯は職員も保護者も同じ。
## アプリだから電話や連絡帳のように「忘れた」 「無くした」の心配はありません。
## カレンダーでのスケジュール共有・連絡事項の配信・個別連絡はチャット機能を搭載。


# App URL


# 利用方法
・専用ページより新規登録・ログイン
・メニュー一覧ページへ遷移する


・施設から家庭への一斉連絡は左上「学校からの連絡」をクリック
・学校からの連絡内容一覧ページへ遷移する
・連絡内容をクリックすると連絡内容詳細ページへ遷移する
・施設側のみ内容の新規投稿・編集・削除が可能
## 施設側
一連の動画
## 家庭側
一連の動画

・施設と家庭との個別連絡は右上「ご家庭からの連絡」をクリック
・施設側のユーザーの場合、在籍する児童の一覧ページへ、
  家庭（児童）側のユーザーの場合、在籍している施設のみが表示されたページへ遷移する
・連絡履歴のある場合には「チャットへ」、無い場合には「チャットルームを作成」ボタンが表示される
・上記ボタンをクリックするとチャットページへ遷移する
## 施設側
一連の動画
## 家庭側
一連の動画

・学校行事の連絡・確認は左下「学校行事」をクリック
・予定されている学校行事一覧ページへ遷移する
・学校行事をクリックすると学校行事詳細ページへ遷移する
・施設側のみ内容の新規投稿・編集・削除が可能
## 施設側
一連の動画
## 家庭側
一連の動画

・欠席・遅刻・早退の連絡は右下「欠席・遅刻・早退のご連絡」をクリック
・施設側のユーザーの場合、連絡があった児童一覧ページへ遷移する
・家庭側のユーザーの場合、新規投稿ページへ遷移する
## 施設側
一連の動画
## 家庭側
一連の動画

・情報漏洩防止による安全対策の点から、ログインユーザー以外が利用しようとした場合、
  どのページにも遷移できない画面が表示されるよう全てのページに設定


# 課題解決

|               課題                |                        課題解決                       |
| -------------------------------- |  --------------------------------------------------  |
| 手紙や連絡帳など共有手段がアナログ     | 共有・確認に必要な機能をアプリにまとめることで抜け・漏れを防ぐ |
| お子様を通すことで情報が混乱する可能性  | 職員と保護者が直接、やり取りできるため不要な誤認を防ぐ        |
| 電話・口頭での確認は非効率            | アプリでの連絡・共有により、それぞれの予定・都合に応じて連絡・確認ができる              |


# 機能一覧

|      特徴      |                    概要                       |
| ------------- |  -------------------------------------------  |
| ユーザー管理機能 | 施設・ユーザーの新規登録・ログイン・ログアウトが可能 |
| スケジュール機能 | 施設はスケジュールの追加・編集・削除が可能（ユーザーは閲覧のみ可能） |
|  メッセージ配信機能  | 施設からユーザーに対し、メッセージの配信が可能         |
|   チャット機能   | 施設とユーザー間においてチャットが可能            |
|   欠席等連絡機能   | ユーザーから施設に対し、欠席・遅刻・早退の連絡が可能            |

## チャット機能
|      特徴      |                    概要                    |
| ------------- | ------------------------------------------ |
| 個別での情報確認 | 職員・保護者ともに仕事・家事・育児による時間の制限があることから、電話（口頭）以外での連絡手段を実装 |


# ローカルでの動作方法

- git clone https://github.com/yhweb-star/digicon
- cd digicon
- bundle install
- rails db:create
- rails db:migrate
- rails s
- http://localhost:3000


# 開発環境

- VScode
- Ruby 2.6.5
- Rails 6.0.3.6
- myspl 5.6.51
- gem 3.0.3
- heroku 7.51.0


# テーブル設計

## schools テーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| facility           | string  | null: false, unique: true |
| ceo                | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| phone              | string  | null: false |

### Association
- has_many :users
- has_many :events
- has_many :rooms
- has_many :messages


## users テーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| facility           | string  | null: false |
| grade              | integer | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| phone              | string  | null: false |
| school         | references | null: false, foreign_key: true |

### Association
- belongs_to :school
- has_many :adsences
- has_many :rooms
- has_many :messages


## rooms テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false |
| school         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :school
- belongs_to :user


## messages テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false |
| school         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :school
- belongs_to :user


## contacts テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| subject     | string     | null: false |
| contents     | string     | null: false |
| school        | references | null: false, foreign_key: true |

### Association
- belongs_to :school


## events テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| subject     | string     | null: false |
| start_time  | datetime       | null: false |
| ending_time | datetime       | null: false |
| place       | string     | null: false |
| details     | string     | null: false |
| school        | references | null: false, foreign_key: true |

### Association
- belongs_to :school


## absences テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| day_when   | date       | null: false |
| reason_id     | integer    | null: false |
| sutatus        | string     | null: false |
| time_when   | time       | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user