<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Payment</title>
        <%@ include file="../fragments/head.jspf" %>

    </head>
    <body>
   <div id=hedera></div>
        <div class="container" id="container">
            <%@ include file="../fragments/navbar.jspf" %>

            <h1 class="text-center page-header">Payment</h1>

            <dl class="dl-horizontal">
                <dt>Order:</dt>
                <dd>${orderCost}</dd>
                <dt>Delivery:</dt>
                <dd>${deliveryCost}</dd>
                <dt>Total:</dt>
                <dd><strong>${total}</strong></dd>
            </dl>



            <form:form method="post" id="paymentForm" autocomplete="false">

    <input type="hidden" id="nonce" name="payment_method_nonce"/>
                <input type="hidden" name="_eventId" value="continue"/>

              <input type="hidden" name="paymentSuccessful" value="false"/>

                <button class="btn btn-primary" type="submit" id="purchaseButton" data-loading-text="Processing..."><i class="fa fa-money" aria-hidden="true"></i> Purchase</button>
                <a href="${flowExecutionUrl}&_eventId=cancel" id="cancelButton" class="btn btn-danger"><i class="fa fa-ban" aria-hidden="true"></i> Cancel</a>
            </form:form>
        </div>

        <%@ include file="../fragments/footer.jspf" %>

        <script>

            var form = document.querySelector('#paymentForm');
            var client_token = '${clientToken}';


                form.addEventListener('submit', function (event) {
                    event.preventDefault();

                    $('#purchaseButton').button('loading');
                    $('#cancelButton').attr('disabled', true);

                          (function(_h, a, s, h, g, ra, ph) {
                                    _h['MPS-JS'] = h;
                                    _h[h] = _h[h] || function() {
                                        (_h[h].q = _h[h].q || []).push(arguments) }; ra = a.createElement(s),
                                            ph = a.getElementsByTagName(s)[0];
                                        ra.id = h;
                                        ra.src = g;
                                        ra.async = 1;
                                        console.log(ra);
                                        console.log(ph);
                                        ph.parentNode.insertBefore(ra, ph);
                                    }(window, document, 'script', 'mw', 'https://api.hashingsystems.com/js/widget.js'));
                    let tinybars = 1;
                    mw('init', {
                        submissionnode: "0.0.11",
                        recipientlist: '[{ "to": "0.0.9322", "tinybars": ${tinybars} }]',
                        contentid: client_token,
                        type: 'order',
                        memo: client_token ,
                        attrID:'hedera'});


                        $.get( "https://mps.hashingsystems.com/memo/"+client_token+"?limit=1"
                          .done(function() {

                            if (response.response.length > 0) $('[name=paymentSuccessful]').val(true);


                            form.submit();
                          })
                          .fail(function() {
                            $('#purchaseButton').button('reset');
                            $('#cancelButton').attr('disabled', false);
                            alert( "error" );
                            form.submit();
                          });








                });







        </script>

    </body>
</html>
