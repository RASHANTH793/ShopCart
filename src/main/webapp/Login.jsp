<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopCart-Login</title>
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
            background: url('https://img.freepik.com/free-photo/supermarket-banner-concept-with-ingredients_23-2149421160.jpg?t=st=1733823956~exp=1733827556~hmac=fd8739948f08eac0d431de2292743d0cfb87ada419c540cd8a631362163aa718&w=1380') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            overflow: hidden;
        }
        .form-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 350px;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translate(-50%, -40%);
            }
            to {
                opacity: 1;
                transform: translate(-50%, -50%);
            }
        }
        .error{
                color:red;
            }
            .button{
                padding: 5px;
                width: 6%;
                background: cornflowerblue;
                color: white;
            }

            #msg
            {
                background: green;
                color:black;
                border: 1px solid green;
                width:40%;
                font-weight: bold;
                font-size: 30px;
                padding: 5px;
                margin-top:15px
            }
            td input{
                display:block;
            }

    </style>
    <script>
            jQuery.validator.addMethod("checkemail", function(value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            }, "Please enter the email format as abc@gmail.com");

            jQuery(document).ready(function($) {
                $("#login").validate({
                    rules: {
                        Email: {
                            required: true,
                            checkemail: true
                        },
                        Password: {
                            required: true,
                            minlength: 6
                        },
                    },
                    messages: {
                        Email: {
                            required: "Please enter the email.",
                        },
                        Password: {
                            required: "Please enter the password.",
                            minlength: "Please enter the password greater than or equal to 6.",
                        },
                    }
                });
            });
        </script>
</head>
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
                            <a class="nav-link" href="Signup.jsp">Signup<span class="sr-only">(current)</span></a>
                        </li>
                    </ul> 
                </div>
            </div>
        </div>
    </nav>
    <div class="form-container">
        <h3 class="text-center mb-3">Login</h3>
        <form method="post" action="home" id="login">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control"  placeholder="Enter email" name="Email">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control"  placeholder="Enter password" name="Password">
            </div>
            <button type="submit" class="btn btn-primary w-100" name="Login">Login</button>
        </form>
    </div>
</body>
</html>