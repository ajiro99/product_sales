// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require materialize-sprockets
$(function() {
  $(document).on('change', "[id^='sale_sale_products']", function (){
    body_price = 0
    lense1_price = 0
    lense2_price = 0

    if ($("#sale_sale_products_attributes_0_product_id option:selected").text() != "") {
      body_price = parseInt($("#sale_sale_products_attributes_0_product_id option:selected").text().split('/')[5].replace(",", ""));
    }

    if ($("#sale_sale_products_attributes_1_product_id option:selected").text() != "") {
      lense1_price = parseInt($("#sale_sale_products_attributes_1_product_id option:selected").text().split('/')[5].replace(",", ""));
    }

    if ($("#sale_sale_products_attributes_2_product_id option:selected").text() != "") {
      lense2_price = parseInt($("#sale_sale_products_attributes_2_product_id option:selected").text().split('/')[5].replace(",", ""));
    }

    $("#sale_stocking_price").val(body_price + lense1_price + lense2_price);
    $("#sale_cost").val(parseInt($("#sale_stocking_price").val()) + parseInt($("#sale_bonus_price").val())).change();
  });

  $(document).on('keyup', "#sale_stocking_price", function (){
    $("#sale_cost").val(parseInt($("#sale_stocking_price").val()) + parseInt($("#sale_bonus_price").val())).change();
  });

  $(document).on('keyup', "#sale_bonus_price", function (){
    $("#sale_cost").val(parseInt($("#sale_stocking_price").val()) + parseInt($("#sale_bonus_price").val())).change();
  });

  $(document).on('keyup', "#sale_selling_price", function (){
    $("#sale_fee").val(parseInt($("#sale_selling_price").val()) * 0.1);
    $("#sale_sales").val(parseInt($("#sale_selling_price").val()) - parseInt($("#sale_fee").val()) - parseInt($("#sale_shipping_cost").val())).change();
  });

  $(document).on('keyup', "#sale_shipping_cost", function (){
    $("#sale_sales").val(parseInt($("#sale_selling_price").val()) - parseInt($("#sale_fee").val()) - parseInt($("#sale_shipping_cost").val())).change();
  });

  $(document).on('change', "#sale_cost", function (){
    $("#sale_profit").val(parseInt($("#sale_sales").val()) - parseInt($("#sale_cost").val())).change();
  });

  $(document).on('change', "#sale_sales", function (){
    $("#sale_profit").val(parseInt($("#sale_sales").val()) - parseInt($("#sale_cost").val())).change();
  });

  $(document).on('change', "#sale_profit", function (){
    $("#sale_profit_rate").val((parseInt($("#sale_profit").val()) / parseInt($("#sale_sales").val())) * 100);
  });
});