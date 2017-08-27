
if ($('.vendor-show')) {
  $.getJSON( location.href +".json",function(data){
    $('#vendor-table').DataTable({
      destroy: true,
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
}


if ($('.vendor-index')) {
  $.getJSON( "/vendors.json",function(data){
    $('#vendor-index-table').DataTable({
      destroy: true,
      data: data,
      columns: [
                { title: "Vendor", className: ""}
              ]
    });

    $('#vendor-index-table').on('click', 'tbody td', function() {
      console.log(data[this.parentNode.rowIndex - 1])
      window.location.href = '/vendor/' + data[this.parentNode.rowIndex - 1]
    })


  })

}
