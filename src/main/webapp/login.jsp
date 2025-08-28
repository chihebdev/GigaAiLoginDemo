<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #121212; /* Dark background */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    form {
      background-color: #1e1e1e;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
      width: 300px;
      display: flex;
      flex-direction: column;
    }

    label {
      color: #ddd;
      margin-bottom: 0.5rem;
      font-size: 0.9rem;
    }

    input {
      padding: 0.7rem;
      margin-bottom: 1.2rem;
      border: none;
      border-radius: 8px;
      background-color: #2a2a2a;
      color: #fff;
      font-size: 1rem;
    }

    input:focus {
      outline: none;
      border: 1px solid #4cafef;
      background-color: #333;
    }

    button {
      background-color: #4cafef;
      color: white;
      padding: 0.8rem;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s;
    }

    button:hover {
      background-color: #379ad8;
    }
  </style>
</head>
<body>
  <form action="LoginServlet" method="post">
    <label for="username">Username</label>
    <input type="text" id="username" name="username" placeholder="Enter username" required>
    
    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter password" required>
    
    <button type="submit">Login</button>
  </form>
</body>
<body>
</body>
</html>
