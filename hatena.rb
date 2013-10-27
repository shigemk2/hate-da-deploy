# -*- coding: utf-8 -*-
require "rubygems"
require "watir"
require "watir-webdriver"

# yamlファイル読み込み
require 'yaml'
yaml = YAML.load_file "hatena.yaml"

# ログイン
browser = Watir::Browser.new :chrome
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

# デザインページへアクセス
browser.goto(yaml["detail_url"])

# ヘッダーを編集
header = File.open("hatena-header.html", "r:SHIFT_JIS")
element = browser.text_field(:id, "textarea1")
element.flash
element.value = header.read
header.close

# フッターを編集
footer = File.open("hatena-footer.html", "r:SHIFT_JIS")
element = browser.text_field(:id, "textarea2")
element.flash
element.value = footer.read
footer.close

# CSSを編集
css = File.open("hatena.css", "r:SHIFT_JIS")
element = browser.text_field(:id, "textarea3")
element.flash
element.value = css.read
css.close

element = browser.button(:name, "save")
element.flash
element.click

browser.goto(yaml["top_url"])
puts browser.url
