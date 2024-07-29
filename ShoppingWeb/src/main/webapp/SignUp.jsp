<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            background-color: rgb(248, 247, 240);
        }

        .encapsulating-box{
            background-color: white;
        }
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .encapsulating-box {
            width: 50%;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container center-container">
        <div class="encapsulating-box">
            <h2>Sign in</h2>
            <form action="SignUp" class="row g-3" method="post">
                <div class="form-floating">
                    <input type="text" class="form-control" id="name" name="name"  placeholder="name" required>
                    <label for="name">Name</label>
                </div>
                <div class="form-floating">
                    <input type="email" class="form-control" id="email" name="email"  placeholder="name@example.com" required>
                    <label for="email">Email address</label>
                </div>
                <div class="form-floating">
                <input type="password" class="form-control" id="password" name="password"  placeholder="Password" required>
                <label for="password">Password</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="address" name="address"  placeholder="" required>
                <label for="address">Address</label>
            </div>
            <div class="col-md-6">
                <label for="inputCity" class="form-label">City</label>
                <input type="text" class="form-control" id="inputCity" name="inputCity" >
            </div>
            <div class="col-md-4">
                <label for="inputState" class="form-label">State</label>
                <input id="inputState" name="inputState" type="text" class="form-control">
            </div>
            <div class="col-md-2">
                <label for="inputZip" class="form-label">Zip</label>
                <input type="number" class="form-control" name="inputZip">
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck" name="gridCheck" required>
                    <label class="form-check-label" for="gridCheck">
                        Accept Our privacy policy
                    </label>
                </div>
            </div>
            <div class="col-6">
                <button type="submit" class="btn btn-warning">Sign in</button>
            </div>
            <div class="col-6">
                <p>Already have an account <a href="Login.jsp">Login</a></p>
            </div>
        </form>
    </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous">
    </script>    
</body>
</html>