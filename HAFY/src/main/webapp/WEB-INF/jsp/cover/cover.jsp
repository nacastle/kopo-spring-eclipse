<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
    <title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/cover/cover.css" rel="stylesheet">
    
    <script>
    
    setTimeout(() => {
		location.href = "${pageContext.request.contextPath }/login"    
	}, 3000);
    
    </script>
    
  </head>

  <body class="text-center" style="background: #27b2a5">

    <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
      <header class="masthead mb-auto">
      </header>

      <main role="main" class="inner cover">
        <h1 class="cover-heading">H A F Y</h1>
        <p class="lead">Hana Auction For You</p>
        <p class="lead">
        </p>
      </main>

      <footer class="mastfoot mt-auto">
        <div class="inner">
          <p>Developed by <a href="https://github.com/nacastle">@nacastle</a>.</p>
        </div>
      </footer>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    
  </body>
</html>
