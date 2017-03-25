products = []
productsIds = []
t = 0 ;

jQuery(document).ready(function($) {


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
          '<tr title="' + product['name'] + '" data-id="' + product['id'] + '" data-price="' + product['Price'] + '">' +
          '<td>' + product['name'] + '</td>' +
          '<td title="Unit Price">' + product['price'] + '</td>' +
          '<td title="Quantity"><input type="number" class="quantity" min="1" value=1 style="width: 30px;" id=' + product['id'] + '_q value=""/></td>' +
          '<td title="Total" id=' + product['id'] + '_t>$' + total + '</td>' +
          '<td title="Remove from Cart" class="text-center" style="width: 40px;"><a href="javascript:void(0);" class="btn btn-xs btn-danger ' + "classProductRemove" + '">X</a></td>' +
          '</tr>'
        );
        total = product['price']*Number($("#"+product['id']+"_q").val());
        $("#"+product['id']+"_t").text(total);
    }
  }));


 $(document).on("input", ".quantity", function () {
  var id = this.id.split("_")[0];
  var price = Number($(this).closest("td").prev('td').text());
  var totalThis = this.value * price ;
  $("#"+id+"_t").text(totalThis) ;
  t += totalThis ;
  $("#total").text(t);
    });
});