// Toggle password visibility
        const togglePassword = document.getElementById('togglePassword');
        const password = document.getElementById('password');
        
        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="far fa-eye"></i>' : '<i class="far fa-eye-slash"></i>';
        });

        // Form validation
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const studentID = document.getElementById('UserID').value;
            const password = document.getElementById('password').value;
            const message = document.getElementById('message');
            
            // Simple validation
            if (UserID === '' || password === '') {
                showMessage('Please fill in all fields', 'error');
                return;
            }
            
            if (UserID.length < 3) {
                showMessage('Student ID must be at least 3 characters', 'error');
                return;
            }
            
            if (password.length < 6) {
                showMessage('Password must be at least 6 characters', 'error');
                return;
            }
            
            // Simulate successful login
            showMessage('Login successful! Redirecting...', 'success');
            
            // In a real application, you would redirect or make an API call here
            setTimeout(() => {
                // Redirect to main page or dashboard
                window.location.href = 'Bentler.html';
                console.log('Redirecting to dashboard...');
            }, 2000);
        });

        function showMessage(text, type) {
            const message = document.getElementById('message');
            message.textContent = text;
            message.className = type;
            message.style.display = 'block';
            
            // Hide message after 5 seconds
            setTimeout(() => {
                message.style.display = 'none';
            }, 5000);
        }