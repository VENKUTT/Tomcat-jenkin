<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ELPDevOps - DevOps Training Institute</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link href="css/sticky-footer-navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Add Font Awesome library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f7f7f7;
		}

		.container {
			background-color: #ffffff;
			padding: 20px;
			margin-top: 20px;
			border-radius: 5px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		}

		header {
			text-align: center;
			margin-bottom: 20px;
		}

		#tabs {
			margin-top: 30px;
		}

		#tabs ul {
			background-color: #007bff;
			border-radius: 5px;
			padding: 10px 0;
		}

		#tabs ul li a {
			color: #ffffff;
			padding: 10px 20px;
			text-decoration: none;
		}

		#tabs ul li a:hover {
			background-color: #0056b3;
		}

		#tabs .ui-tabs-active a {
			background-color: #0056b3;
		}

		#tabs div {
			padding: 20px;
		}

		.enquiry-form {
			margin-top: 30px;
		}

		.enquiry-form h3 {
			text-align: center;
			margin-bottom: 20px;
		}

		.enquiry-form form {
			max-width: 400px;
			margin: 0 auto;
		}

		.enquiry-form form .form-group {
			margin-bottom: 20px;
		}

		.enquiry-form form label {
			display: block;
			font-weight: bold;
		}

		.enquiry-form form input[type="text"],
		.enquiry-form form input[type="email"],
		.enquiry-form form textarea {
			width: 100%;
			padding: 10px;
			font-size: 16px;
			border: 1px solid #cccccc;
			border-radius: 5px;
		}

		.enquiry-form form textarea {
			resize: vertical;
		}

		.enquiry-form form button {
			background-color: #007bff;
			color: #ffffff;
			border: none;
			padding: 10px 20px;
			font-size: 16px;
			border-radius: 5px;
			cursor: pointer;
		}

		.enquiry-form form button:hover {
			background-color: #0056b3;
		}

		.devops-images {
			margin-top: 30px;
		}

		.devops-images .row img {
			margin-bottom: 20px;
			border-radius: 5px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		}

		.whatsapp-icon {
			text-align: center;
			margin-top: 30px;
		}

		.whatsapp-icon a {
			display: inline-block;
			background-color: #25D366;
			color: #ffffff;
			border-radius: 50%;
			padding: 20px;
			font-size: 30px;
		}

        /* Additional CSS styles for a beautiful website */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        header {
            text-align: center;
            margin-bottom: 20px;
        }
        #tabs {
            margin-top: 30px;
        }
        #tabs ul {
            background-color: #007bff;
            border-radius: 5px;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
        }
        #tabs ul li a {
            color: #ffffff;
            padding: 10px 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        #tabs ul li a:hover {
            background-color: #0056b3;
        }
        #tabs .ui-tabs-active a {
            background-color: #0056b3;
        }
        #tabs div {
            padding: 20px;
        }
        .enquiry-form {
            margin-top: 30px;
        }
        .enquiry-form h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        .enquiry-form form {
            max-width: 400px;
            margin: 0 auto;
        }
        .enquiry-form form .form-group {
            margin-bottom: 20px;
        }
        .enquiry-form form label {
            display: block;
            font-weight: bold;
        }
        .enquiry-form form input[type="text"],
        .enquiry-form form input[type="email"],
        .enquiry-form form textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 5px;
        }
        .enquiry-form form textarea {
            resize: vertical;
        }
        .enquiry-form form button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .enquiry-form form button:hover {
            background-color: #0056b3;
        }
        .devops-images {
            margin-top: 30px;
        }
        .devops-images .row img {
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .whatsapp-icon {
            text-align: center;
            margin-top: 30px;
        }
        .whatsapp-icon a {
            display: inline-block;
            background-color: #25D366;
            color: #ffffff;
            border-radius: 50%;
            padding: 20px;
            font-size: 30px;
        }
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function() {
            $("#tabs").tabs();
        });
    </script>
</head>
<body>
    <div class="container">
        <header>
            <h1>ELPDevOps - DevOps Institute Contact Number: 9032317548</h1>
        </header>

        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">AWS</a></li>
                <li><a href="#tabs-2">Azure</a></li>
                <li><a href="#tabs-3">DevOps</a></li>
                <li><a href="#tabs-4">Docker</a></li>
                <li><a href="#tabs-5">Kubernetes</a></li>
                <li><a href="#tabs-6">Terraform</a></li>
            </ul>
            <div id="tabs-1">
                <p>Information about AWS training...</p>
                <p>Our AWS training offers hands-on experience through enterprise-level projects, providing students with practical skills to excel in the industry.</p>
            </div>
            <div id="tabs-2">
                <p>Information about Azure training...</p>
                <p>Our Azure training is project-oriented, enabling students to gain real-world expertise and tackle enterprise-level challenges with confidence.</p>
            </div>
            <div id="tabs-3">
                <p>Information about DevOps training...</p>
                <p>Our DevOps training focuses on real-world projects, allowing students to apply their knowledge in enterprise-level scenarios for successful implementation.</p>
            </div>
            <div id="tabs-4">
                <p>Information about Docker training...</p>
                <p>Our Docker training involves hands-on projects to master containerization techniques and deploy applications efficiently at scale.</p>
            </div>
            <div id="tabs-5">
                <p>Information about Kubernetes training...</p>
                <p>Our Kubernetes training emphasizes project-based learning, equipping students with the skills needed to manage containerized applications in production environments.</p>
            </div>
            <div id="tabs-6">
                <p>Information about Terraform training...</p>
                <p>Our Terraform training is project-oriented, enabling students to automate infrastructure as code and handle complex cloud deployments with ease.</p>
            </div>
        </div>

        <!-- Enquiry Form -->
        <div class="enquiry-form">
            <h3>Enquiry Form</h3>
            <form method="post" action="send_email.php">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                </div>
                 <div class="form-group">
                    <label for="email">contact:</label>
                    <input type="email" class="form-control" id="contact" name="contact" placeholder="Enter your contact number" required>
                </div>

                <div class="form-group">
                    <label for="message">Message:</label>
                    <textarea class="form-control" id="message" name="message" rows="3" placeholder="Enter your message" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <!-- DevOps Images -->
        <div class="devops-images row">
            <div class="col-md-3">
                <img src="images/devops2.jpg" alt="DevOps Image 1" class="img-fluid rounded">
            </div>
            <!-- Add more images here if needed -->
        </div>

        <!-- WhatsApp Icon and Contact Us -->
        <div class="whatsapp-icon">
            <a href="https://wa.me/9059564278" target="_blank">
                <i class="fab fa-whatsapp fa-4x"></i>
            </a>
            <p>Contact Us: 9059564278</p>
        </div>

    </div>

    <div class="container">
        <footer class="footer">
            &copy; ELPDevOps Software Services Pvt. Ltd. | Contact: 9059564278
        </footer>
    </div>
</body>
</html>

