
$.getJSON( location.href +".json",function(data){
  var orderTable = $('#order-table').DataTable({
                      data: data,
                      columns: [
                                { title: "City", className: ""},
                                { title: "Product Name",  className: ""},
                                { title: "Price", className: "" },
                                { title: "Quantity", className: "" },
                                { title: "Date and Time", className: "" }
                              ]
                    });
})
