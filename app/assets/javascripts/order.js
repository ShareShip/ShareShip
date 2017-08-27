
$.getJSON( "/orders.json",function(data){
  $('#order-table').DataTable({
    destroy: true,
    data: data,
    columns: [
              { title: "City", className: ""},
              { title: "Product Name",  className: ""},
              { title: "Price", className: "" },
              { title: "Quantity", className: "" },
              { title: "Phone", className: "" },
              { title: "Date and Time", className: "" }
            ]
  });
})
