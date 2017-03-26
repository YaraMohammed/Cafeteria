products = []
productsIds = []
found = []
t = 0 ;

// jQuery(document).on("turbolinks:load",(function($) {
  jQuery(document).ready(function($){
    console.log("njnb")
    $("#order_notes").val("");

//handle listening to products images
  $("body").on('click' , '.allProducts' , (function (){
    productId = this.id;
    name = $("#name_"+this.id).text();
    price = Number(this.alt);
    if(productsIds.includes(productId)){
      $("#msg_"+this.id).text("*already added")
    }
    else{
      var product = {"id":productId,"price":price,"name":name}
      products.push(product);
      productsIds.push(productId);
        total = product['price'] ;
        $("#items").append(
          '<tr title="' + product['name'] + '" id="' + product['id'] + '" data-price="' + product['Price'] + '">' +
          '<td>' + product['name'] + '</td>' +
          '<td title="Unit Price">' + product['price'] + '</td>' +
          '<td title="Quantity"><input type="number" class="quantity" min="1" value=1 style="width: 30px;" id=' + product['id'] + '_q value=""/></td>' +
          '<td title="Total" id=' + product['id'] + '_t>$' + total + '</td>' +
          '<td title="Remove from Order" class="text-center" style="width: 40px;"><a href="javascript:void(0);" class="btn btn-xs btn-danger ' + "classProductRemove" + '">X</a></td>' +
          '</tr>'
        );
        total = product['price']*Number($("#"+product['id']+"_q").val());
        $("#"+product['id']+"_t").text(total);
        t += total ;
        $("#total").text(t);
    }
  }));

//calculate total for product and order
 $(document).on("input", ".quantity", function () {
  var id = this.id.split("_")[0];
  var price = Number($(this).closest("td").prev('td').text());
  var totalThis = this.value * price ;
  $("#"+id+"_t").text(totalThis) ;
  t += price ;
  $("#total").text(t);
    });

//handle X buttom
 $("body").on("click",".btn-danger",function(){
  this.closest("tr").remove();
  var i = productsIds.indexOf(this.closest("tr").id);
  products.splice(i,1);
  productsIds.splice(i,1);
  var totalThis = Number(this.closest("tr").children[2].children[0].value) * Number((this).closest("tr").children[1].innerText) ;
  t -= totalThis ;
  $("#total").text(t);
 })


 //Send data to controller
 $("#save_order").click(function(event) {

 // stop form from submitting normally 
   event.preventDefault();
   console.log("stop")

  var order_products=[]
   $("#items").children().each(function(){
     product_id=Number(this.id)
     product_quantity=Number(this.children[2].children[0].value)
     order_products.push({"id":product_id,"quantity":product_quantity})
   });
   var user=""
   if($("#order_user_id").val() != null) 
    {
      user=$("#order_user_id").val() 
    }
  console.log(user)
  var finalOrder = {"notes": $("#order_notes").val() ,"room": $("#order_room").val(), "products":JSON.stringify(order_products),"usr":user}
  /* Send the data using post and put the results in a body */
    $.ajax({
      url: "/orders/new",
      type: "post",
      data: finalOrder,
      success: function(response) {
        $('body').html(response);
      },
      error:function(){
       alert('Error');
      }
    });
});


//search bar
  $("#search").keyup(function(){
    console.log($(this).val().toLowerCase())
 //    $.each(products,function(){
 //      // if(this['name'])
 //      console.log(this);
 //    })
 // // var val = $(this).val().toLowerCase();
 // //  if(products['name'].includes(val))
 // //    console.log(val);
 // //  else
 // //    console.log("not found")
  
 });

});
// }));