// $(document).on('turbolinks:load', function () {
//   $('#country').select2();
// });

$(document).on('turbolinks:load', function () {

    $("#listing_address_attributes_country").select2({
      allowClear: true,
      theme: "bootstrap"
    });
    $("#listing_address_attributes_province").select2({
      allowClear: true,
      theme: "bootstrap"
    });
    $("#listing_address_attributes_city").select2({
      allowClear: true,
      theme: "bootstrap"
    });
  
    var country
    $(document.body).on("change", "#listing_address_attributes_country", function () {
      
      $("#listing_address_attributes_province").empty();
      $("#listing_address_attributes_city").empty();
      country = this.value;
      
      const provinceSelect = document.getElementById('listing_address_attributes_province');

      var url = '/province';
      var data = {
        country: country
      };

      $.getJSON(url, data, function (data, status) {
        if (status == 200 || status == 'success') {
          $("#listing_address_attributes_province").select2({
            placeholder: "please select an option...",
            data: data,
            theme: "bootstrap",
            allowClear: true
          })
        }
      });
    });

    $(document.body).on("change", "#listing_address_attributes_province", function () {
      $("#listing_address_attributes_city").empty();
      var province = this.value;
      const provinceSelect = document.getElementById('listing_address_attributes_city');

      var url = '/city';
      var data = {
        country: country,
        province: province
      };
  
      $.getJSON(url, data, function (data, status) {
        if (status == 200 || status == 'success') {
          $("#listing_address_attributes_city").select2({
            placeholder: "please select an option...",
            data: data,
            theme: "bootstrap",
            allowClear: true
          })
        }
      });
    });

  });