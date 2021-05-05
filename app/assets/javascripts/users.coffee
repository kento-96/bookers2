# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#address_zipcode").jpostal({
    postcode:["#address_zipcode"],
    address:{
      "#user_prefecture_code":"%3",
      "#address_city":"%4%5",
      "#address_street":"%6%7"
      }
  })
  
   # 入力項目フォーマット
    # %3 都道府県
    # %4 市区町村
    # %5 町域
    # %6 大口事業所の番地
    # %7 大口事業所の名称
    
    # 初回画面以降自動入力できず
    # 以下をlink_toに記入後解消
    # data: {"turbolinks" => false}