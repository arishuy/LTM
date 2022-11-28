<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="prd_name" required="true" type="java.lang.String"%>
<%@ attribute name="prd_price" required="true" type="java.lang.String"%>

<div class="product">
	<div class="product-img">
		<img src="https://cdn.tgdd.vn/Products/Images/42/258047/TimerThumb/samsung-galaxy-z-flip4.jpg" alt="">
	</div>
	<div class="product-info">
		<h3 class="product-name">${prd_name}</h3>
		<div class="product-price">Giá: ${prd_price}</div>
		<div class="product-btn">
			<a href="#">Mua hàng</a>
		</div>
	</div>
</div>
