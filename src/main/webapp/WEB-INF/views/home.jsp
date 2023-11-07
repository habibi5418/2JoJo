<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<!-- Google tag (gtag.js) -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-CMBGRHC3KW"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'G-CMBGRHC3KW');
	</script>
	<title>Home</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h1>
		Hello world!  
	</h1>
	
	<P> ${list } </P>
</body>
</html>
