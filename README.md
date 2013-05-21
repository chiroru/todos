# todos
まだ、未完成のため利用できません。

## About
backbone.js + sinatraのサンプルアプリケーションです。

## Description
backbone.js + sinatraのサンプルアプリケーションです。
データストアにはMongDBを利用しています。

## Instration

### 1. sinatraのインストール
<pre><code> $ gem install sinatra
</code></pre>

### 2. Gemfileの作成
以下の内容でGemfileを作成する。

<pre>
<core>
ource 'https://rubygems.org'

gem 'sinatra'
gem 'haml'
gem 'sequel'
gem 'json'
gem 'mongo'
gem 'bson_ext'

group :development do
  gem 'sinatra-contrib'
end
</core>
</pre>
