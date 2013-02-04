$(function () {
    $("#addtocart").click(function () {
        addToCart();
    });

    function addToCart() {
        $('#addtocart').hide();
        $('#pricepanel .loading').show();

        $.ajax({
            type: "POST",
            url: '/Cart/AddToCart',
            data: { "ProductId": $('#ProductId').val(), "UnitPrice": $('#ProductId').val() },
            traditional: true,
            success: function () {
                location.href = '/Cart/Index';
            },
            error: function (xhr, textStatus, errorThrown) {
                if (!userAborted(xhr)) {
                    alert("Sistemle İlgili Bir Hata Oluştu; Lütfen Daha Sonra Tekrar Deneyiniz.");
                }
            },
            statusCode: {
                404: function () {
                    alert("HTTP404: Sepete eklemeye çalıştığınız ürün bulunamadı");
                },
                400: function () {
                    alert("HTTP400: Sepete ekleme bilgisi hatalı. Lütfen Daha Sonra Tekrar Deneyiniz.");
                }
            }
        });
    }
});