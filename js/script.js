// Initialize Swiper
var swiper = new Swiper(".home-slider", {
    loop: true,
    grabCursor: true,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
});

var foodSwiper = new Swiper(".food-slider", {
    loop: true,
    grabCursor: true,
    spaceBetween: 20,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    breakpoints: {
        0: {
            slidesPerView: 1,
        },
        768: {
            slidesPerView: 2,
        },
        1024: {
            slidesPerView: 3,
        },
    },
});

// Cart functionality
let cart = [];
let cartCount = 0;
let cartTotal = 0;

const cartTab = document.querySelector('.cartTab');
const closeCartButton = document.querySelector('.close');
const listCart = document.querySelector('.listCart');
const cartTotalElement = document.getElementById('cartTotal');
const body = document.body;

// Add to cart functionality
document.querySelectorAll('.addCart').forEach(button => {
    button.addEventListener('click', function() {
        const name = this.getAttribute('data-name');
        const price = parseInt(this.getAttribute('data-price'));
        
        // Find the image for this item
        const box = this.closest('.box');
        const imgSrc = box.querySelector('.Item img').src;
        
        addToCart(name, price, imgSrc);
    });
});

function addToCart(name, price, imagePath) {
    const existingItem = cart.find(item => item.name === name);
    
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.push({
            name: name,
            price: price,
            quantity: 1,
            image: imagePath
        });
    }
    
    updateCart();
    saveCartToStorage();
    showNotification(`${name} added to cart!`);
}

function removeFromCart(name) {
    cart = cart.filter(item => item.name !== name);
    updateCart();
    saveCartToStorage();
}

function updateQuantity(name, change) {
    const item = cart.find(item => item.name === name);
    
    if (item) {
        item.quantity += change;
        
        if (item.quantity <= 0) {
            removeFromCart(name);
        } else {
            updateCart();
            saveCartToStorage();
        }
    }
}

function updateCart() {
    cartCount = cart.reduce((total, item) => total + item.quantity, 0);
    
    cartTotal = cart.reduce((total, item) => total + (item.price * item.quantity), 0);
    cartTotalElement.textContent = cartTotal;
    
    listCart.innerHTML = '';
    
    if (cart.length === 0) {
        listCart.innerHTML = '<div class="empty-cart">Your cart is empty</div>';
        return;
    }
    
    cart.forEach(item => {
        const cartItem = document.createElement('div');
        cartItem.className = 'cart-item';
        cartItem.innerHTML = `
            <img src="${item.image}" alt="${item.name}">
            <div class="name">${item.name}</div>
            <div class="totalPrice">R${item.price * item.quantity}</div>
            <div class="quantity">
                <span class="minus" onclick="updateQuantity('${item.name}', -1)">-</span>
                <span class="number">${item.quantity}</span>
                <span class="plus" onclick="updateQuantity('${item.name}', 1)">+</span>
            </div>
        `;
        listCart.appendChild(cartItem);
    });
}

function showNotification(message) {
    const notification = document.createElement('div');
    notification.style.cssText = `
        position: fixed;
        top: 100px;
        right: 20px;
        background: var(--primary-color);
        color: white;
        padding: 15px 20px;
        border-radius: 8px;
        z-index: 1002;
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        animation: slideIn 0.3s ease;
    `;
    notification.textContent = message;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 2000);
}

const style = document.createElement('style');
style.textContent = `
    @keyframes slideIn {
        from { transform: translateX(100%); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
    }
    
    @keyframes slideOut {
        from { transform: translateX(0); opacity: 1; }
        to { transform: translateX(100%); opacity: 0; }
    }
`;
document.head.appendChild(style);

// Cart open/close functionality - FIXED CHECKOUT BUTTON
document.querySelector('.checkOut').addEventListener('click', () => {
    if (cart.length === 0) {
        alert('Your cart is empty!');
        return;
    }
    
    // Save cart to localStorage and redirect to payment page
    saveCartToStorage();
    body.classList.remove('showCart');
    window.location.href = 'payment.html';
});

closeCartButton.addEventListener('click', () => {
    body.classList.remove('showCart');
});

// Toggle cart when clicking on cart icon
document.addEventListener('click', (e) => {
    if (e.target.classList.contains('addCart')) {
        body.classList.add('showCart');
    }
});

// Mobile menu toggle
document.getElementById('menu-btn').addEventListener('click', () => {
    document.querySelector('.navbar').classList.toggle('active');
});

// Countdown Timer
var countDownDate = new Date("Oct 31, 2025 00:00:00").getTime();

var countdownFunction = setInterval(function() {
    var now = new Date().getTime();
    var distance = countDownDate - now;

    // Check if the countdown has ended
    if (distance < 0) {
        clearInterval(countdownFunction);
        document.getElementById("days").innerHTML = "00";
        document.getElementById("hours").innerHTML = "00";
        document.getElementById("minutes").innerHTML = "00";
        document.getElementById("seconds").innerHTML = "00";
        
        // Update the heading when countdown ends
        document.querySelector('.count .content2 h1').innerHTML = "Our <span>Full-course</span> Meal is Here!";
        document.querySelector('.count .content2 h3').innerHTML = "Special Now Available";
        return;
    }

    // Calculate time units
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Add leading zeros
    days = days < 10 ? "0" + days : days;
    hours = hours < 10 ? "0" + hours : hours;
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    // Update the display
    document.getElementById("days").innerHTML = days;
    document.getElementById("hours").innerHTML = hours;
    document.getElementById("minutes").innerHTML = minutes;
    document.getElementById("seconds").innerHTML = seconds;
    
}, 1000);

// Count Up Functionality
function startCountUp() {
    const countItems = document.querySelectorAll('.count-item');
    
    const observerOptions = {
        threshold: 0.5,
        rootMargin: '0px 0px -100px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const countNumber = entry.target.querySelector('.count-number');
                const target = parseInt(countNumber.getAttribute('data-target'));
                animateCountUp(countNumber, target);
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    countItems.forEach(item => {
        observer.observe(item);
    });
}

function animateCountUp(element, target) {
    let current = 0;
    const increment = target / 100;
    const duration = 2000; // 2 seconds
    const stepTime = Math.abs(Math.floor(duration / (target / increment)));
    
    const timer = setInterval(() => {
        current += increment;
        if (current >= target) {
            element.textContent = formatNumber(target);
            clearInterval(timer);
        } else {
            element.textContent = formatNumber(Math.floor(current));
        }
    }, stepTime);
}

function formatNumber(num) {
    if (num >= 1000) {
        return (num / 1000).toFixed(1) + 'K';
    }
    return Math.floor(num).toString();
}

// Save cart to localStorage whenever it changes
function saveCartToStorage() {
    localStorage.setItem('cart', JSON.stringify(cart));
}

// Load cart from localStorage when page loads
document.addEventListener('DOMContentLoaded', function() {
    const savedCart = localStorage.getItem('cart');
    if (savedCart) {
        cart = JSON.parse(savedCart);
        updateCart();
    }
    
    // Initialize count up
    startCountUp();
});

// Optional: Re-initialize count up when section comes into view 
function initCountUpOnScroll() {
    const countUpSection = document.querySelector('.count-up');
    
    const sectionObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                startCountUp();
                sectionObserver.unobserve(entry.target);
            }
        });
    }, { threshold: 0.3 });

    if (countUpSection) {
        sectionObserver.observe(countUpSection);
    }
}

// Initialize everything when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    initCountUpOnScroll();
    updateCart(); // Ensure cart is updated on page load
});