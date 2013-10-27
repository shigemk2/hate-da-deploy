hatena-diary
===============

はてなダイアリーの自動デプロイツール。

「管理ページ→デザイン→詳細」でCSSやヘッダー、フッターを直接弄ることがあるのだけれど、
バージョン管理とかもされないし、毎回ブラウザで操作するのが面倒です。

しかし、はてなダイアリーのCSSやヘッダーを直接弄るAPIは用意されていないので、
ローカルでファイルを弄って、コマンド1つでCSSやヘッダーをwatirで反映させるようにしました。

[watir公式サイト](http://watir.com/)
[公式GitHub](https://github.com/watir/watir)

自動かどうかは微妙ですが。

### 導入

1. hatena.yaml.sampleを参考に、hatena.yamlに必要な情報を書く
2. ヘッダーのHTMLをhatena-header.htmlに、フッターのHTMLをhatena-footer.htmlに、CSSをhatena.cssに書き、直下のディレクトリに配置する

1と2をやったあとに、以下を実行する。


```zsh
bundle install
ruby hatena.rb
```

### 動作環境

当方の環境は

MacOSX 10.8.5
ruby ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-darwin12.4.0]

です。その他の環境では試していません。

[![Dependency Status](https://gemnasium.com/shigemk2/hatena-diary.png)](https://gemnasium.com/shigemk2/hatena-diary)

