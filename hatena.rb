# coding: utf-8
require 'bundler'
Bundler.require
require 'yaml'

# yamlファイル読み込み
yaml = YAML.load_file "hatena.yaml"

# ログイン
browser = Watir::Browser.new :ff
browser.goto(yaml["login_url"])

element = browser.text_field(:id, "login-name")
element.flash
element.value = yaml["user_id"]

element = browser.text_field(:class, "password")
element.flash
element.value = yaml["password"]

element = browser.button(:class, "custom-button")
element.flash
element.click
browser.wait

# デザインページへアクセス
browser.goto(yaml["detail_url"])

# ヘッダーを編集
header = File.open("hatena-header.html", "r")
element = browser.text_field(:id, "textarea1")
element.flash
element.value = header.read.encode("utf-8")
header.close

# # フッターを編集
footer = File.open("hatena-footer.html", "r")
element = browser.text_field(:id, "textarea2")
element.flash
element.value = footer.read.encode("utf-8")
footer.close

# # CSSを編集
css = File.open("hatena.css", "r")
element = browser.text_field(:id, "textarea3")
element.flash
element.value = css.read.encode("utf-8")
css.close

element = browser.button(:name, "save")
element.flash
element.click

browser.goto(yaml["top_url"])
puts browser.url
