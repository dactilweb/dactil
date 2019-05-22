<form action="${initParam['urlpaypal']}" method="POST" target="_top">
    <input type="hidden" name="business" value="10000189.joan23@fje.edu"/>
    <input type="hidden" name="return"  value="10000189.joan23@fje.edu"/>
    <input type="hidden" name="cmd" value="_cart"/>
    <input type="hidden" name="upload" value="1"/>

    
<c:forEach items="${sessionScope.listaCarrito}" var="pro">
    <c:set var="c" value"${c+1}"/>
           <input type="hidden" name="item_name${c}" value="${pro.nombre_producto}"/>
        <input type="hidden" name="item_number${c}" value="${pro.p.webid}"/>
        <input type="hidden" name="amount${c}"  value="${pro.p.precio}"/>
        <input type="hidden" name="quantity${c}" value="${pro.p.cantidad}"/>
        
</c:forEach>
        <input type="image" src="https://www.sandbox.paypal.com/es_ES/ES/i/btn/btn_buynow_LG.gif" border="0" name="submit" alt="Paypal, la forma mas rapida y segura de pagar en internet"/>
               <img alt=""  border="0"  src="https://www.sandbox.paypal.com/es_ES/ES/i/scr/btn_buynow_LG.gif" width="1" height="1">
      </form> 
