function add_to_cart(pid,pname,price){
	
	let cart = localStorage.getItem("cart");
	if(cart == null){
		//no cart yet
		let products=[];
		let product={productId:pid,productName:pname,productQuantity:1,productPrice:price}
		
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		showToast("Product is added to cart")
		
	}else{
		//cart is present
		let pcart=JSON.parse(cart);
		let oldproduct=pcart.find((item)=>{
			return item.productId == pid
		});
		if(oldproduct){
			//we have to increase quntity
			oldproduct.productQuantity = oldproduct.productQuantity+1;
			pcart.map((item)=>{
				if(item.productId==oldproduct.productId){
					item.productQuantity=oldproduct.productQuantity
					console.log("oldproduct")
				}
			});
			localStorage.setItem("cart",JSON.stringify(pcart));
			showToast(oldproduct.productName+" quantity is increased")
		}else{
			//we have add product
			let product={productId:pid,productName:pname,productQuantity:1,productPrice:price}
			pcart.push(product)
			console.log("new product")
			localStorage.setItem("cart",JSON.stringify(pcart));
			showToast("Product is added to cart")
		}
	}
	updateCart()
}

//update cart
function updateCart(){
	let cartString = localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null || cart.length==0){
		console.log("cart is empty")
		$(".cart-items").html("0");
		$(".cart-body").html("<h3>Cart does not have any item</h3>");
		$(".checkout-btn").addClass('disabled');
	}
	else{
		//if cart is not empty
		console.log(cart+"in a cart")
		console.log(cart.length)
		$(".cart-items").html(`${cart.length}`);
		let table = `
			  <table class='table table-bordered table-responsive'>
	 <thead class='thead-light'>
	  <tr>
   <th>Product Name</th>
   <th>price</th>
   <th>Quantity</th>
   <th>Total Price</th>
   <th>Action</th>
   </tr>
   <thead>
  
  `;
  let totalprice=0;
  cart.map((item) => {
	  table+=`
	  <tr>
	  <td>${item.productName}</td>
	  <td>${item.productPrice}</td>
	  <td>${item.productQuantity}</td>
	  <td>${item.productQuantity*item.productPrice}</td>
	  <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
	  </tr>`;
	  
	  totalprice+=item.productPrice*item.productQuantity;
	  
  })

		table=table+`
		<tr><td colspan='5' class='text-end fw-bold m-5'>Total Price:${totalprice}</td></tr>
		</table>`;
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass('disabled');
		
	}
}
//delete item from cart
 function deleteItemFromCart(pid){
	 let cart = JSON.parse(localStorage.getItem('cart'));
	 let newCart = cart.filter((item) => item.productId != pid)
	 
	 localStorage.setItem("cart",JSON.stringify(newCart));
	 updateCart();
	 showToast("Product is removed from cart")
	 
 }

$(document).ready(function(){
	updateCart();
})

function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>{
		
		$("#toast").removeClass("display");
	},2000);
}
function goToCheckout(){
	window.location="checkout.jsp";
}

