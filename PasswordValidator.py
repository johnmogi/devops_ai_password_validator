# Python Password Validator

def is_strong_password(password):
    """Check if the password is strong."""
    if len(password) >= 8 and any(char in '!@#$%^&*()_+' for char in password):
        return True
    return False

# User input
password = input("Enter your password: ")

# Check password strength
if is_strong_password(password):
    print("Password is strong.")
else:
    print("Password is weak. It must be at least 8 characters long and contain at least one special character.")
