workspace {

    model {
        // Define People (Actors)
        customer = person "Customer" "Places orders using the totem system."
        admin = person "Admin" "Manages products, users, and order statuses."

        // Define Systems
        backend = softwareSystem "Ordering Backend System" "Processes orders, manages products and users, and integrates with the payment system."
        paymentSystem = softwareSystem "Payment System" "External payment system to handle payment processing."

        // Define Relationships
        customer -> backend "Places orders through frontend totem interface"
        admin -> backend "Manages orders, products, and users via admin frontend"
        backend -> paymentSystem "Sends payment requests and receives confirmations"
    }

    views {
        // Context View
        systemContext backend {
            include *
            autolayout lr
        }

        theme default
    }
}
