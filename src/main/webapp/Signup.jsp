<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopCart-Register</title>
    <link rel="icon" type="image" href="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css"
        integrity="sha512-6f7HT84a/AplPkpSRSKWqbseRTG4aRrhadjZezYQ0oVk/B+nm/US5KzQkyyOyh0Mn9cyDdChRdS9qaxJRHayww=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel='stylesheet'
        href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet'
        href='https://cdn-uicons.flaticon.com/2.6.0/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet'
        href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>
        <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        
</head>
<style>
     nav {
        display: flex;
        width: 100%;
    }

    .container {
        display: flex;
    }

    ul {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;

    }

    ul li {
        margin-right: 20px;
    }

    ul li a {
        color: black;
        font-weight: 600;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    p {
        font-weight: bolder;
        font-size: larger;
    }

    input {
        width: 20px;
        border-radius: 5px;
        outline: none;
    }

    .custom-font {
        font-family: 'Brush Script MT', cursive;
        font-size: 6rem;
    }

    .custom-text {
        font-size: 1.2rem;

    }

    .image-container img {
        height: auto;
        /* Makes the height responsive */
        object-fit: cover;
        /* Ensures proper aspect ratio */
        max-height: 600px;
        /* Limits maximum height for larger screens */
    }

    @media (max-width: 768px) {
        .custom-font {
            font-size: 2.5rem;
            /* Adjust font size for smaller screens */
        }

        .custom-text {
            font-size: 1rem;
            /* Adjust text size for smaller screens */
        }
    }
    body {
            background: url('https://img.freepik.com/free-photo/3d-apple-illustration_23-2151800464.jpg?t=st=1733825229~exp=1733828829~hmac=c7c692d3a2baad190f50f626f1400102eb3a1ac381d3657eeda4af619683da30&w=1380') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            overflow: hidden;
            font-family: Arial, sans-serif;
        }
        .form-container {
            position: absolute;
            top: 50%;
            left: 100%;
            transform: translateY(-50%);
            width: 400px;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: slideIn 1.5s ease-out forwards;
        }
        @keyframes slideIn {
            from {
                left: 100%;
                opacity: 0;
            }
            to {
                left: 50%;
                transform: translate(-50%, -50%);
                opacity: 1;
            }
        }
        .error{   
                color:red;
            }
            input{
                display: block;
            }
            #msg
            {
                background: red;
                color:black;
                border: 1px solid red;
                width:24%;
                font-weight: bold;
                font-size: 25px;
                padding: 5px;
            }
</style>
<script type="text/javascript">
jQuery.validator.addMethod("checkemail", function(value, element) {
    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
});
jQuery(document).ready(function($) {
    $("#signup").validate({
        //ignore: [],
        rules: {
            name: {
                required: true
            },
            email: {
                required: true,
                checkemail: true
            },
            password: {
                required: true,
                minlength: 6
            },
            ConfirmPassword: {
                required: true,
                minlength: 6,
                equalTo: "#password"
            }
        },
        messages: {
            name: {
                required: "Please enter the name."
            },
            email: {
                required: "Please enter the email.",
                email: "Please enter valid email id"
            },
            password: {
                required: "Please enter the password.",
                minlength: "Please enter the password greater than or equal to  6.",
            },
            ConfirmPassword: {
                required: "Please reenter the password.",
                minlength: "Please enter the password greater than or equal to 6.",
                equalTo: "mismatch password"
            }
        }
    });
});
</script>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand p-0 mt-2" href="Home.jsp" style="margin-left: 70px;">
            <img src="https://i.pinimg.com/originals/d6/6d/38/d66d38c2c59118fa58055ff0436c9fc2.jpg" width="60"
                height="50" class="d-inline-block align-center" alt="">
            Shopcart
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Compress01"
            aria-controls="Compress01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="Compress01">
            <div class="container">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item ">
                        <a class="nav-link" href="Home.jsp">Home<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <div class="dropdown">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item " style="list-style: none;">
                            <a class="nav-link" href="Login.jsp">Login<span class="sr-only">(current)</span></a>
                        </li>
                    </ul> 
                </div>
            </div>
        </div>
    </nav>

    <div class="form-container">
        <h3 class="text-center mb-2">Sign Up</h3>
        <form action="home" id="signup" method="post">
            <div class="mb-2">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="name" placeholder="Enter username">
            </div>
            <div class="mb-2">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" placeholder="Enter email">
            </div>
            <div class="mb-2">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
            </div>
            <div class="mb-2">
                <label for="password" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" name="ConfirmPassword" placeholder="Enter Confirm password">
            </div>
            <button type="submit" class="btn btn-success w-100" name = "Signup">Sign Up</button>
        </form>
    </div>
    
</body>
</html>