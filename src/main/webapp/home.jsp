<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demo Main Page</title>
<style>
    body {
      font-family: Arial, sans-serif;
      background-color: #121212;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      color: #eee;
    }

    .card {
      background-color: #1e1e1e;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
      width: 320px;
      text-align: center;
    }

    h2 {
      margin-bottom: 1.5rem;
      color: #4cafef;
    }

    .info {
      margin-bottom: 1rem;
      text-align: left;
    }

    .info strong {
      color: #bbb;
    }

    button {
      background-color: #4cafef;
      color: white;
      padding: 0.8rem 1.2rem;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s;
      margin-top: 1rem;
      width: 100%;
    }

    button:hover {
      background-color: #379ad8;
    }
</style>
</head>
<body>
  <div class="card">
    <h2>Welcome, ${sessionScope.user}!</h2>

    <div class="info"><strong>Storage:</strong> ${sessionScope.storage} MB</div>
    <div class="info"><strong>Bandwidth:</strong> ${sessionScope.bandwidth} MB</div>
    <div class="info"><strong>Max File Size:</strong> ${sessionScope.max_file_size} MB</div>

    <form action="LogoutServlet" method="get"> 
      <button type="submit">Logout</button>
    </form>
  </div>
</body>
</html>
