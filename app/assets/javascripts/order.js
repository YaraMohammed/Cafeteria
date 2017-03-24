products = []

jQuery(document).ready(function($) {

  $(".allProducts").click(function (){
    productId = this.id
    if(products.includes(productId)){
      console.log("already there");
      $("#msg").text("*already added")
    }
    else{
      products.push(productId);
      console.log("add to order "+productId);
      console.log("update total");
    }
  });
});